class User < ActiveRecord::Base
  # attr_accessible :title, :body
  
  def User::create_user!(params)
    token = SecureRandom.base64
    params[:session_token] = token
    User.create!(params)
  end
  
end
