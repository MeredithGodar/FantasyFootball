require 'spec_helper'

describe UsersController do

  describe 'show' do
    UsersController.show
  end

  describe 'create' do
    UsersController.create
  end

  describe 'new' do
    UsersController.new
  end

  describe 'create and show' do 
    UsersController.create
    UsersController.show
  end

end
