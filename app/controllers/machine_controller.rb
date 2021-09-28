class MachineController < ApplicationController
  def show
    @metric = Metric.find(name: metric_params[:name]).or(Metric.find(machine_id: metric_params[:machine_id]))
    @name = metric.name
    @num = 1

    while @name.nil?

      @name = "Machine #{@num}"

      next unless @name.uniq!

      @name = "Machine' #{@num += 1}"

      return "Machine with uuid #{metric.uuid} was give name #{@name}"

    end
  end


  def search
  end

  
end
