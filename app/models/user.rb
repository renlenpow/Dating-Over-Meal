class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :profile, :dependent => :destroy
  has_many :activities, :dependent => :destroy
  has_many :thoughts, :dependent => :destroy

  # Setup accessible (or protected) attributes for your model
  attr_accessor :firstname, :lastname
  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :remember_me
  
  validates_presence_of :firstname, :lastname
  
  after_create :create_user_profile
  after_create :log_registration_activity
  
  include Gravtastic
  gravtastic
  
  def recent_activities
    self.activities.order("created_at DESC").limit(50)
  end
  
  def recent_thoughts
    self.thoughts.order("created_at DESC").limit(5)
  end
  
  private
  
  def create_user_profile
    self.create_profile(:firstname => firstname, :lastname => lastname)
  end
  
  def log_registration_activity
    self.activities << Activity.create(:activity_name => "join", :activity_description => "#{self.firstname} joined Dating Over Meal")
  end
  
end
