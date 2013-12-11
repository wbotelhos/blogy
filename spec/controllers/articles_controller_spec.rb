require 'spec_helper'

describe ArticlesController do
  context 'accessing the admin area' do
    context :unlogged do
      it 'redirect to the login page' do
        get :new
        response.should redirect_to login_path
      end

      it 'redirect to the login page' do
        get :edit, id: 1
        response.should redirect_to login_path
      end

      it 'redirect to the login page' do
        put :update, id: 1
        response.should redirect_to login_path
      end

      it 'redirect to the login page' do
        post :create
        response.should redirect_to login_path
      end
    end
  end
end
