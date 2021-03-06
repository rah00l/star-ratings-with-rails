class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:role_ids
  # attr_accessible :title, :body
  has_many :ratings
  
  has_many :articles
  has_many :photos
  has_many :events
 
  has_many :comments


  # Added user role based relationship
  has_many :assignments ,:dependent => :destroy
  has_many :roles, :through => :assignments

  #def role?(role)
  #  roles.include? role.to_s
  #end

  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end

end
