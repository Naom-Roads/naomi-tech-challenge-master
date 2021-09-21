class MetricsController < ApplicationController
  before_action :set_category_info, only: [:index]
  before_action :set_page_info, only: [:index]

  def index
    @sort_dir = params[:sort] == 'ASC' ? 'ASC' : 'DESC'
    respond_to do |format|
      format.html do
        @chart_data = Metric.where(category: @category).group(:value).limit(10).order(Arel.sql('COUNT(metrics.value) DESC')).size
        @metrics = Metric.where(category: @category).order(machine_id: @sort_dir).page(@page)
       
      end  # added @page value in place of params 

      format.json do
        @metrics = Metric.where(category: @category).order(machine_id: @sort_dir).page(@page)
        render json: { sort: @sort_dir, metrics: @metrics }.to_json
      end
    end
  end

  # def update
  #   metric = Metrics.select(category: metric_params[:category], machine_id: metric_params[:machine_id])
  #   if metric.exists?
  #       Metric.update(value)
  #       render json: metric.to_json, status: 201

  # end  // Ask about creating another method during dev hour

  def create
    metric = Metric.where(category: metric_params[:category], machine_id: metric_params[:machine_id])
  #  try find or initialize by
    if metric.exists?
      metric.update(value: metric_params[:value])
      render status: 204
    else
      metric = Metric.new(metric_params)
      metric.save
      render json: metric.to_json, status: 201
    end
  end

  def show; end

  private

  def metric_params
    params.require(:metric).permit(:machine_id, :category, :value)
  end

  def set_page_info 
    @page = params[:page].nil? ? 2 : params[:page].next # dynamic page loading here 

  end

  def set_category_info
    @categories = Metric.select(:category).distinct.map { |c| c.category }.sort
    @category = if @categories.include? params[:category]
                  params[:category]
                else
                  @categories.first
                end
  end
end
