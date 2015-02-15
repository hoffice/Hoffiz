class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  attr_accessor :current_password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  validates :firstname, presence: true

  acts_as_messageable
  
  has_many :events

  def name
    self.firstname
  end

  def mailboxer_email(object)
    self.email
  end

  def self.from_omniauth(auth)

    name = (auth.info.name).split
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.firstname = name.first
      if name.count > 1
        user.lastname = name[1..-1].join
      end
	    user.avatar = auth.info.image 
	  end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
