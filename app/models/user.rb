class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
  has_attached_file :avatar, 
    :styles => { :medium => "300x300>", :thumb => "200x200#" },
    :storage => :aws,
    :s3_credentials => {
      :access_key_id => 'AKIAIGHKJHBKXPQHPWIQ',
      :secret_access_key => '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'
    },
    :s3_acl => :public_read,
    :s3_protocol => 'http',
    :s3_bucket => :dom305,
    :path => "user_avatar/:id/:style/:randomized_filename.jpg"
    
  Paperclip.interpolates :randomized_filename do |attachment, style|
    attachment.instance.randomized_filename
  end
  
  has_one   :profile, :dependent => :destroy
  has_many  :activities, :dependent => :destroy
  has_many  :thoughts, :dependent => :destroy
  has_many  :relationships, :foreign_key => :follower_id, :dependent => :destroy
  has_many  :following, :through => :relationships, :source => :followed
  has_many  :reverse_relationships, :foreign_key => :followed_id, :class_name => "Relationship", :dependent => :destroy
  has_many  :followers, :through => :reverse_relationships, :source => :follower
  has_many  :messages, :foreign_key => :receiver_id, :dependent => :destroy
  has_many  :rates
  has_many  :interactions, :dependent => :destroy
  has_many  :appointments, :foreign_key => :inviter_id, :dependent => :destroy
  has_many  :albums, :dependent => :destroy
  has_many  :videos, :dependent => :destroy
  
  # Setup accessible (or protected) attributes for your model
  attr_accessor :firstname, :lastname, :birth_day, :birth_month, :birth_year
  attr_accessible :firstname, :lastname, :email, :username, :password, :password_confirmation, :remember_me, :avatar, :facebook_token,
  :birth_day, :birth_month, :birth_year
  
  validates_presence_of :firstname, :lastname, :username, :birth_day, :birth_month, :birth_year, :on => :create
  validates_uniqueness_of :username, :on => :create
  validates :username, :format => {:with => /\A[a-zA-Z0-9_]+\z/, :message => "Only letters, numbers and underscores are allowed"}
  
  after_create :create_user_profile
  after_create :log_registration_activity
  
  ajaxful_rater
  
  def randomized_filename
    "#{self.id}_#{Digest::MD5.hexdigest("dom")}"
  end
  
  def recent_activities
    self.activities.order("created_at DESC").limit(50)
  end
  
  def recent_thoughts
    self.thoughts.order("created_at DESC").limit(5)
  end
  
  def following?(followed)
    self.relationships.find_by_followed_id(followed)
  end
  
  def follow!(followed)
    self.relationships.create(:followed_id => followed.id)
  end
  
  def inbox_messages
    Message.where("parent_id IS NULL AND (sender_id = #{self.id} OR receiver_id = #{self.id})")
  end
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    logger.info "Dumping access token"
    logger.info access_token
    logger.info "Dumping facebook data"
    logger.info data
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password. 
      birth_day = data['birthday'].split("/")
      birth_month = Date::MONTHNAMES[birth_day[0].to_i][0,3]
      user = User.create(:email => data['email'], :username => "user#{Time.now.to_i + 1}", :password => Devise.friendly_token[0,20], :firstname => data['first_name'], 
      :lastname => data['last_name'], :facebook_token => access_token['credentials']['token'], :birth_day => birth_day[1], :birth_month => birth_month,
      :birth_year => birth_day[2]
      )
      profile = user.profile
      profile.update_attribute(:gender, data['gender'])
      #save_facebook_profile_image(access_token, user)
      user
    end
  end
  
  def self.save_facebook_profile_image(access_token, signed_in_resource)
    facebook_image_url = access_token['user_info']['image'].gsub("square", "large")
    url = URI.parse(facebook_image_url)
    res = Net::HTTP.start(url.host, url.port) { |http|
      http.get(facebook_image_url)
    }
    signed_in_resource.avatar = open(res['location'])
    signed_in_resource.save
    signed_in_resource
  end
  
  def like_place(place)
    c = {:user_id => self.id, :place_id => place.id, :kind => :like}
    l = Interaction.new(c)
    
    if l.valid?
      self.interactions << Interaction.create(c)
      true
    else
      false
    end
  end
  
  def like_place?(place)
    !self.interactions.where(:place_id => place.id, :kind => :like).first.nil?
  end
  
  def liked_places
    Place.where(:id => self.interactions.where(:kind => :like).map(&:place_id))
  end
  
  def has_visited_place(place)
    c = {:user_id => self.id, :place_id => place.id, :kind => :visit}
    i = Interaction.new(c)
    if i.valid?
      self.interactions << Interaction.create(c)
      true
    else
      false
    end
  end
  
  def has_visited_place?(place)
    !self.interactions.where(:place_id => place.id, :kind => :visit).first.nil?
  end
  
  def visited_places
    Place.includes(:images).where(:id => self.interactions.where(:kind => :visit).map(&:place_id))
  end
  
  def proposed_appointments
    Appointment.where("inviter_id = #{self.id} OR invitee_id = #{self.id}")
  end
  
  private
  
  def create_user_profile
    self.create_profile(:firstname => firstname, :lastname => lastname, :birth_day => birth_day, :birth_month => birth_month, 
    :birth_year => birth_year)
  end
  
  def log_registration_activity
    self.activities << Activity.create(:activity_name => "join", :activity_description => "#{self.firstname} joined Dating Over Meal")
  end
  
end
