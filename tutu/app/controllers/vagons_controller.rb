class VagonsController < ApplicationController
  before_action :set_vagon, only: [:show, :edit, :update, :destroy]

  def index
    @vagons = Vagon.all
  end

  def show
  end

  def new
    @vagons = Vagon.new
  end

  def create
    @vagon = Vagon.new(vagon_params)
    if @vagon.save
      redirect_to @vagons
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @vagon.update(vagon_params)
      redirect_to @vagon
    else
      render :edit
    end
  end

  def destroy
    @vagon.destroy
    redirect_to vagons_path
  end


  private

  def set_vagon
    @vagon = Vagon.find(params[:id])
  end

  def vagon_params
    params.require(:vagon).permit(:vagon_type, :top_places, :bottom_places, :train_id)
  end
end