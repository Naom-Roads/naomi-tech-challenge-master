class WorkstationsController < ApplicationController

  def index
    @workstations = Workstation.all
  end

  def show
    @workstation = Workstation.find_by(id: params[:id])
  end

end
