class WorkstationController < ApplicationController

  def show
    @workstation = Workstation.find_by(params[:id])
    @user = User.find(@workstation.user_id)

    end





  def search
  end

end
