class ShowsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_show

  def index
    @shows = Show.all
    render json: @shows
  end

  def show
    render json: @show
  end

  def create
    @show = Show.find_or_create_by(strong_params)
    render json: @show
  end
  
  def destroy
    Show.delete(@show)
  end

  private

  def find_show
    @show = Show.find_by(id: params[:id])
  end

  def strong_params
    params.require(:show).permit(:name, :image, :summary, :language, :show_type, :genres, :network, :premiered, :status, :rating, :runtime, :official_site)
  end

end
