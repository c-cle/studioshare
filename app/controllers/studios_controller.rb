class StudiosController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_studio, only: [:show, :edit, :update, :destroy]

  def index
    @studios = Studio.all
    if params[:search]
      @studios = Studio.search(params[:search]).order("created_at DESC")
    else
      @studios = Studio.all.order('created_at DESC')
    end
  end

  def show
    # @review = Review.new
    # @reservation = Reservation.new
  end

  def new
    @studio = Studio.new
    # authorize @studio
  end

  def create
    @studio = Studio.new(studio_params)
    @studio.user = current_user
    # authorize @studio
    if @studio.save
      redirect_to studio_path(@studio)
    else
      redirect_to studios_path
    end
  end

# user must be logged in at this stage

  def edit
    @studio = Studio.find(params[:id])
  end

  def update
    if @studio.update(studio_params)
      redirect_to studio_path(@studio)
    else
      render :edit
    end
  end

  def destroy
    @studio.destroy
    redirect_to dashboards_path
  end

  private

  def set_studio
    @studio = Studio.find(params[:id])
    # authorize @studio # use when you require pundit
  end

  def studio_params
    params[:studio].permit(:name, :price, :photo_url, :address, :opening_hour, :closing_hour)
  end
end
