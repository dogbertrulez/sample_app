require 'spec_helper'

describe User do
  before(:each) do
    @attr_valid = {:name => "John Doe", 
                   :email => "hello@hello.com",
                   :password => "foobar1234",
                   :password_confirmation => "foobar1234"};
                   
    @attr_no_name = @attr_valid.merge(:name => "");
    @attr_no_email =  @attr_valid.merge(:email => "");
    @attr_no_pass = @attr_valid.merge(:password => "");
    @attr_no_pass_confirm = @attr_valid.merge(:password_confirmation => "");
    
    
    @attr_blank = {:name => '', 
                   :email => '', 
                   :password => '', 
                   :password_confirmation => ''};
  end
  
  it "should require a name, email, password, password confirmation" do
    User.new(@attr_valid).should be_valid
    
    User.new(@attr_blank).should_not be_valid
    User.new(@attr_no_name).should_not be_valid    
    User.new(@attr_no_email).should_not be_valid
    User.new(@attr_no_pass).should_not be_valid
    User.new(@attr_no_pass_confirm).should_not be_valid
    User.new(@attr_blank).should_not be_valid
  end
  
  it "should reject fields that are too long" do
    User.new(@attr_valid.merge(:name => ('a'*51))).should_not be_valid
    
    User.new(@attr_valid.merge(:email => (('a'*70) + '@' + 'example.com'))).should_not be_valid  
    User.new(@attr_valid.merge(:email => (('a'*30) + '@' + ('b'*250) + 'example.com'))).should_not be_valid  
  end
  
  
  
  it "should require a unique email" do
    User.create!(@attr_valid);
    User.new(@attr_valid).should_not be_valid;
    User.new(:name => @attr_valid[:name], 
             :email => @attr_valid[:email].upcase).should_not be_valid;
  end
  
  
  it "should accept valid email addresses" do
    valid_emails = %w[user@foo.com user@foo.org example.user@foo.co HELLO@heLo.com]
    valid_emails.each do |addr|
      User.new(@attr_valid.merge(:email => addr)).should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    invalid_emails = %[user@foo,com user_at_foo.org example.user@foo.]
    invalid_emails.each do |addr|
      User.new(@attr_valid.merge(:email => addr)).should_not be_valid
    end
  end
  
  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr_valid);
    end
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
    
    it "should be false if the passwords dont match" do
      @user.has_password?("invalid").should be_false
    end
  end
end
