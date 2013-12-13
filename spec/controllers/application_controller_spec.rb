require 'spec_helper'

describe ApplicationController do

  describe 'set users' do
    ApplicaitonController.set_current_user
  end

  describe 'current user' do
    ApplicationController.currentUser?('555')
  end

end
