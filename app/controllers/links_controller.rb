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

  private

  # Before Filters
  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:title, :link)
  end

end
