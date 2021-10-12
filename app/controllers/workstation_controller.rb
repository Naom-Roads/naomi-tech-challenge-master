class WorkstationController < ApplicationController
  #TODO it's common (though not required) to have search be a part of the index page, with the default being 'all' and any search constraints being params.
  # This lets us stay within resourceful routing patterns nicely and means less non-standard route names to remember
  def index
    #TODO create search here
  end

  def show
    @workstation = Workstation.find(params[:id])
    @user = User.find(@workstation.user_id)


  end



end
