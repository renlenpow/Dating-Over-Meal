class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :profile, :dependent => :destroy

  # Setup accessible (or protected) attributes for your model
  attr_accessor :firstname, :lastname
  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :remember_me
  
  validates_presence_of :firstname, :lastname
  
  after_create :create_user_profile
  
  include Gravtastic
  gravtastic
  
  private
  
  def create_user_profile
    self.create_profile(:firstname => firstname, :lastname => lastname)
  end
  
end
