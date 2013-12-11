require 'spec_helper'

describe UsersController do
  context 'accessing the admin area' do
    context :unlogged do
      it 'redirect to the login page' do
        get :edit, id: 1
        response.should redirect_to login_path
      end

      it 'redirect to the login page' do
        get :update, id: 1
        response.should redirect_to login_path
      end
    end
  end
end
