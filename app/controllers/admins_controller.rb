class AdminsController < ApplicationController
  before_filter :authenticate_user!, :check_role
  
  def invite
    @user = User.new
  end
  
  def welcome
    @user = User.new(params[:user])
    redirect_to invite_writer_path, notice: "Email Id is invalid." and return if ( params[:user][:email].blank? ||  (params[:user][:email] =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i) != 0 )
    AdminMailer.invite(@user).deliver
    redirect_to users_index_path, notice: "Mail Successfully send."
  end
  
  def check_role
    redirect_to Writer.find(current_user.role_id), notice: "You don't have access to this page." if current_user.role_type == "Writer"
  end
end
