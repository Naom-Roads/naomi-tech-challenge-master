class WorkstationsController < ApplicationController

  def index
    if params[:search]
      @workstations = Workstation.where(name: workstation_params[:search]).or(machine_id: workstation_params[:search])
      redirect_to workstation_path
    else
      # flash[:notice] = "Workstation not found"
      @workstations = Workstation.all
    end
  end

  def show

    @workstation = Workstation.find_by(id: workstation_params[:id])
    @metrics = Metrics.where(workstation_id: @workstation.id)

  end


private

  def workstation_params
    params.require(:workstation).permit(:name, :id, :machine_id, :search)
  end



end
