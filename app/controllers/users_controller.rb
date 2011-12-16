class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id]);
    @title = User.name;
  end
  
  def new
    @title = "Sign up"
  end
end
