require 'spec_helper'

describe PagesController do
  render_views

  @@base_title = "Sample App | ";
  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
      response.should have_selector("title", :content => @@base_title+"Home")
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
      response.should have_selector("title", :content => @@base_title+"Contact")
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
      response.should have_selector("title", :content => @@base_title+"About")
    end
  end
  
  describe "GET 'map'" do
    it "returns http success" do
      get 'map'
      response.should be_success
      response.should have_selector("title", :content => @@base_title+"Map")
    end
  end
  
  describe "GET 'help'" do
    it "returns http success" do
      get 'help'
      response.should be_success
      response.should have_selector("title", :content => @@base_title+"Help")
    end
  end
end
