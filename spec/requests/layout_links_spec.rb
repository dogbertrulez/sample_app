require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Home page at '/'" do get '/'
    response.should have_selector('title', :content => "Home")
  end
  
  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end
  
  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end
  
  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end

  it "should have a Sign up page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
  
  def verify_link(page_name)
    click_link page_name
    response.should have_selector('title', :content => page_name)
  end 

  it "should have the right links on the layout" do
    visit root_path
    verify_link("Home")
    verify_link("About")
    verify_link("Contact")
    verify_link("Site Map")
    verify_link("Sign up")  
  end
  

end
