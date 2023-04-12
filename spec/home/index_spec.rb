require 'rails_helper'

RSpec.describe 'Home Page', type: :feature do

  before do
    visit root_path
  end

  describe 'Link to Log in' do
    context "when successful" do
      it "When clicked, we are taken to the login page with a welcome message" do
        expect(page).to have_link("Sign in with Spotify")
        login_with_oauth
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Welcome, Test User")
      end
    end 
    
    context "when NOT successful" do
      it 'when clicked, we are taken to the login page' do
        click_on('Sign in with Spotify')
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Spotify Login Failed")
      end
    end 
  end

  describe "Link to logout" do
    it "when clicked, the user is logged out with a message notification them " do
      login_with_oauth
      expect(page).to have_link("Logout")
      click_link "Logout"
      expect(page).to_not have_link("Logout")
      expect(page).to have_link("Sign in with Spotify")
      expect(current_path).to eq(root_path)
      expect(page).to have_content("You have been logged out")
    end
  end

  describe "Link to go home " do
    it "when clicked, the user is redirected to the home page" do
      expect(page).to have_link("Home")
      click_link("Home")
      expect(current_path).to eq(root_path)
    end
  end
end