require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
      response.should have_selector("title", :content => "Sample App | Home")
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
      response.should have_selector("title", :content => "Sample App | Contact")
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
      response.should have_selector("title", :content => "Sample App | About")
    end
  end
  
  describe "GET 'map'" do
    it "returns http success" do
      get 'map'
      response.should be_success
      response.should have_selector("title", :content => "Sample App | Map")
    end
  end
end
