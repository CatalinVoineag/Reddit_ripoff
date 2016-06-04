class LinksController < ApplicationController
  
  before_action :set_link, only: [:edit, :update, :show, :destroy]

  def index
    @links = Link.all
  end

  def show
    @link
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    respond_to do |format|
      if @link.save
        format.html { redirect_to links_path, notice: "Link Created" }
        format.json { render :index, status: :created, location: @link }
      else
        flash.now[:error] = AlertsHelper.getErrorAlertMessages(@link)
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @link
  end

  def update
     respond_to do |format|
      if @link.update_attributes(link_params)
        format.html { redirect_to links_path, notice: "Link Updated" }
        format.json { render :show, status: :created, location: @link }
      else
        flash.now[:error] = AlertsHelper.getErrorAlertMessages(@link)
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @link.destroy
    flash[:success] = "Link Deleted"
    redirect_to links_path
  end

  def up
    link = Link.find(params[:link_id])
    link.up_vote(current_user)
    redirect_to links_path 
    flash[:success] = "Up Vote"
  end

  def down
    link = Link.find(params[:link_id])
    link.down_vote(current_user)
    redirect_to links_path 
    flash[:success] = "Down Vote"
  end

  def comment
    link = Link.find(params[:link_id])
    comment = link.comments.new(user_id: current_user.id, link_id: link.id, text: params[:comments][:text])
    if comment.valid?
      comment.save
      flash[:notice] = "Comment Created"
      redirect_to link
    else
      flash[:error] = "Error"
      redirect_to link
    end
  end

  private

  # Before Filters
  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:title, :link)
  end

end
