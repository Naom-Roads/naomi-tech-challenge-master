class WorkstationsController < ApplicationController

  def index
    @workstations = Workstation.all
    #search goes here
  end

  def show

    @workstation = Workstation.find_by(id: params[:id])
    @metrics = Metrics.where(workstation_id: @workstation.id)

  end


private

  def workstation_params
    params.require(:workstation).permit(:name, :id, :search)
  end



end
