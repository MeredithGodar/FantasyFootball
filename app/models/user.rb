class User < ActiveRecord::Base
#<<<<<<< HEAD
  # attr_accessible :title, :body
  #has_many :players
#=======
	attr_accessible :user_id, :email, :password, :password_confirmation
	#has_secure_password
#>>>>>>> faf9790dd038c5772dd2159da3afc1ebc94fabd7
  
  #before_save{|user| user.email=user.email.downcase}
  before_save :create_session_token
  #validates :user_id, presence: true, length:{maximum: 50}
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  #validates :password, presence: true, length: {minimum: 8}
  #validates :password_confirmation, presence: true
  
  private
  def create_session_token
  	self.session_token = SecureRandom.urlsafe_base64
  end
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
  
  #def User::create_user!(params)
    #token = SecureRandom.base64
    #params[:session_token] = token
    #User.create!(params)
  #end
  
end
