class WritersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_role, only: [:index, :destroy, :edit, :update]
  
  def new
    @writer = Writer.new
    @writer.build_user
  end
  
  def create
    @writer = Writer.new(params[:writer])
    render "new" and return if @writer.invalid?
    @writer.save
    redirect_to @writer, notice: "Writer successfully added."
  end
  
  def show
    redirect_to Writer.find(current_user.role_id), notice: "You don't have access to this Page." and return if ( params[:id] != current_user.role_id.to_s && current_user.role_type == "Writer" )
    @writer = Writer.find params[:id]
  end
  
  def index
    @writers = Writer.all
  end
  
  def edit
    @writer = Writer.find params[:id]
  end
  
  def update
    @writer = Writer.find params[:id]
    @writer.update_attributes(params[:writer])
    render "edit" and return if @writer.invalid?
    redirect_to @writer, notice: "Writer successfully updated"
  end
  
  def destroy
    Writer.destroy params[:id]
    redirect_to writers_path, notice: "Writer successfully deleted"
  end
  
  private
  
  def check_role
    redirect_to Writer.find(current_user.role_id), notice: "You don't have access to this page." if current_user.role_type == "Writer"
  end
end
