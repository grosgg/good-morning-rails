class UsersController < ApiController
 
  skip_before_filter :authenticate_user!, :only => [:create]
 
  def index
    respond_with User.all
  end
 
end
