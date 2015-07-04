class User < ActiveRecord::Base

    ############################# Scema Information ##############################################################
    # #   Column                  Type            Collation       Null  Default     Extra
    # 1   id                        int(11)                         No    None        AUTO_INCREMENT
    # 2   email                     varchar(255)  utf8_unicode_ci   No
    # 3   encrypted_password        varchar(255)  utf8_unicode_ci   No
    # 4   reset_password_token      varchar(255)  utf8_unicode_ci   Yes   NULL
    # 5   reset_password_sent_at    datetime                        Yes   NULL
    # 6   remember_created_at       datetime                        Yes   NULL
    # 7   sign_in_count             int(11)                         Yes   0
    # 8   current_sign_in_at        datetime                        Yes   NULL
    # 9   last_sign_in_at           datetime                        Yes   NULL
    # 10  current_sign_in_ip        varchar(255)  utf8_unicode_ci   Yes   NULL
    # 11  last_sign_in_ip           varchar(255)  utf8_unicode_ci   Yes   NULL
    # 12  created_at                datetime                        No    None
    # 13  updated_at                datetime                        No    None
    # 14  first_name                varchar(255)  utf8_unicode_ci   Yes   NULL
    # 15  last_name                 varchar(255)  utf8_unicode_ci   Yes   NULL
    # 16  mobile_number             varchar(255)  utf8_unicode_ci   Yes   NULL
    # 17  gender                    varchar(255)  utf8_unicode_ci   Yes   NULL
    # 18  uid                       varchar(255)  utf8_unicode_ci   Yes   NULL
    # 19  provider                  varchar(255)  utf8_unicode_ci   Yes   NULL
    # 20  confirmation_token        varchar(255)  utf8_unicode_ci   Yes   NULL
    # 21  confirmed_at              datetime                        Yes   NULL
    # 22  confirmation_sent_at      datetime                        Yes   NULL
    ############################# Scema Information ##############################################################

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:current_password,:role_ids, :attachment_attributes, :address_attributes, :first_name, :last_name, :gender, :mobile_number,  :provider, :uid, :confirmed_at
  # attr_accessible :title, :body

  # Added social-authentication:
  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  # Added User Time Out Feature
  devise :timeoutable, :timeout_in => 10.minutes

  has_many :ratings

  has_many :articles
  has_many :photos
  has_many :events

  has_many :comments


  # Added user role based relationship
  has_many :assignments ,:dependent => :destroy
  has_many :roles, :through => :assignments

  has_one :attachment, as: :attachable, :dependent => :destroy
  accepts_nested_attributes_for :attachment

  has_one :address
  accepts_nested_attributes_for :address

  after_initialize do
    self.attachment ||= self.build_attachment()
    self.address ||= self.build_address()
  end

  has_many :evaluations, class_name: "RSEvaluation", as: :source
  #def role?(role)
  #  roles.include? role.to_s
  #end

  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end

  # class method for google oauth
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
    end
  end

# class method for facebook oauth
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(  provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
      #user.ensure_authentication_token!
      # added extra to create authentication token for user
    end
    user
  end

end
