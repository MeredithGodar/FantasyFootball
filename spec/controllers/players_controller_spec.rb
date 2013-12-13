require 'spec_helper'

describe PlayersController do

  describe 'update' do
  PlayersController.update
  end

  describe 'destroy' do
  PlayersController.destroy
  end

  describe 'show' do
  PlayersController.show
  end

  describe 'edit' do
    PlayersController.edit
  end


  describe 'create' do
    PlayersController.create
  end

  describe 'show' do
    PlayersController.show
  end

  describe 'index' do
    PlayersController.index
  end

  describe 'new' do
    PlayersController.new
  end

  describe 'dontcreate' do
    PlayersController.dontcreate
  end

end
