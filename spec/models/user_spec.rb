require 'spec_helper'

describe User do
  describe 'creating a new user' do
  User.create_with_omniauth('insert test auth here')
  end

  describe 'creating a session token' do
  User.create_session_token()
  end
end
