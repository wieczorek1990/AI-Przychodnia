class UnconfirmedUsersController < ApplicationController
  load_and_authorize_resource :user
  # GET /unconfirmed_users
  # GET /unconfirmed_users.json
  def index
    @unconfirmed_users = User.where('confirmed_at IS NULL')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unconfirmed_users }
    end
  end
  
  def confirm 
    user = User.find(params[:id])
    user.confirm!
    redirect_to unconfirmed_users_path 
  end
end
