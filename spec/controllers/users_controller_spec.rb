require 'spec_helper'

describe UsersController do
  
  render_views
  @@base_title = "Sample App | ";


  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'new'
      response.should have_selector('title', :content => 'Sign up')
    end
  end
  
  
  describe "GET 'show'" do
    before(:each) do
      @valid_user = FactoryGirl.create(:valid_user)
      get :show, :id => @valid_user
    end
    
    it "should be successful" do 
      response.should be_success
    end
    
    it "should find the right user" do
      assigns(:user).should == @valid_user
    end

    it "should have the right title" do
      response.should have_selector("title", :content => @valid_user.name)
    end

    it "should include user's name" do
      response.should have_selector("h1", :content => @valid_user.name)
    end

    it "should inlcude the gravatar" do
      response.should have_selector("h1>img", :class => "gravatar")
    end
  end

end
