class MetricsController < ApplicationController
  before_action :set_category_info, only: [:index]

  def index
    @sort_dir = (params[:sort] == 'ASC')? 'ASC' : 'DESC'
    respond_to do |format|
      format.html {
        @chart_data = Metric.where(category: @category).group(:value).limit(10).order(Arel.sql('COUNT(metrics.value) DESC')).size
        @metrics = Metric.where(category: @category).order(machine_id: @sort_dir).page(params[:page].to_i || 1)
      }

      format.json {
        @metrics = Metric.where(category: @category).order(machine_id: @sort_dir).page(params[:page].to_i || 1)
        render json: { sort: @sort_dir, metrics: @metrics }.to_json
       }
    end
  end

# def update 
#   metric = Metrics.select(category: metric_params[:category], machine_id: metric_params[:machine_id])
#   if metric.exists?
#       Metric.update(value)
#       render json: metric.to_json, status: 201

# end  // Ask about creating another method during dev hour 

def create
   if metric_params[:category].nil? || metric_params[:machine_id].nil? 
    return render json: {data: params, errors: metric.errors.full_messages}.to_json, status: 400  
   end

  metric = Metric.where(category: metric_params[:category], machine_id: metric_params[:machine_id])
    if metric.exists?
     metric.update(:value => metric_params[:value])
     render status: 204
    else
      metric = Metric.new(metric_params)
      metric.save
      render json: metric.to_json, status: 201
    end
end

  private

  def metric_params
    params.require(:metric).permit(:machine_id, :category, :value)
  end

  def set_category_info
    @categories = Metric.select(:category).distinct.map{|c| c.category }.sort
    if @categories.include? params[:category]
      @category = params[:category]
    else
      @category = @categories.first
    end
  end
end
