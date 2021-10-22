class WorkstationsController < ApplicationController

  def index
    if params[:search]
      @workstations = Workstation.search(params[:search])
    else
      @workstations = Workstation.all
    end
  end

  def show
    @workstation = Workstation.find_by(id: params[:id])
    @metrics = Metric.where(workstation_id: @workstation)

  end

  private

  def workstation_params
    params.require(:workstation).permit(:name, :id, :machine_id, :user_id, :search)
  end

end
