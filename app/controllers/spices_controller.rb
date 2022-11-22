class SpicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

#get all spices
  def index
    spice= Spice.all
    render json: spice
  end

  #post spices
  def create
    spice= Spice.create(spice_params)
    render json: spice, status: :created
  end

  #patch spice
  def update
    spice=find_spice
    spice.update(spice_params)
    render json: spice 
  end

  #destroy spice
  def destroy
    spice=find_spice
    spice.destroy
    head :no_content
  end
private

def render_not_found_response
  render json: { error: "Spice not found" }, status: :not_found
end

def spice_params
  params.permit(:title, :image, :description, :notes, :rating)
end

def find_spice
  Spice.find(params[:id])
end

end
