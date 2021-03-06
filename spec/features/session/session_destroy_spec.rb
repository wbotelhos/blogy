# frozen_string_literal: true

require 'support/capybara_box'
require 'support/includes/login'

RSpec.describe User do
  let!(:user) { FactoryBot.create(:user) }

  before do
    login(user)
    visit admin_path
  end

  it 'starts with user access' do
    expect(page).to have_current_path admin_path
  end

  context 'when logout' do
    before { click_link '', href: '/logout' }

    it 'redirects to the home page' do
      expect(page).to have_current_path root_path
    end

    context 'trying to access admin' do
      before { visit admin_path }

      it 'losts the admin access' do
        expect(page).to have_current_path login_path
      end
    end
  end
end
