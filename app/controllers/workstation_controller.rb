class WorkstationController < ApplicationController

  def index

  end

  def show
    @workstation = Workstation.find(params[:id])
    @user = User.find(@workstation.user_id)


  end



end
