class MetricsController < ApplicationController
  before_action :set_category_info, only: [:index]
  before_action :set_page_info, only: [:index]

  def index
    @sort_dir = params[:sort] == 'ASC' ? 'ASC' : 'DESC'
    respond_to do |format|
      format.html do
        @chart_data = Metric.where(category: @category).group(:value).limit(10).order(Arel.sql('COUNT(metrics.value) DESC')).size
        @metrics = Metric.where(category: @category).order(machine_id: @sort_dir).page(@page)
      end # added @page value in place of params

      format.json do
        @metrics = Metric.where(category: @category).order(machine_id: @sort_dir).page(@page)
        render json: { sort: @sort_dir, metrics: @metrics }.to_json
      end
    end
  end

  #Decided to not do update action as my idea of calling an action into another action appeared to be bad practice.
  # Decided to extend 'create' action instead. Still added two tests in rspec to make sure they are working, both have passed

  def create
    if metric_params[:category].empty? || metric_params[:value].empty?
      return render json: nil, status: 400
    end

    metric = Metric.find_by(machine_id: metric_params[:machine_id], category: metric_params[:category])
    if metric
      metric.update(value: metric_params[:value])
      render json: metric.to_json, status: 200
    else
      metric = Metric.create(metric_params)
      render json: metric.to_json, status: 201
      puts metric.errors.messages
    end
  end

  private

  def metric_params
    params.require(:metric).permit(:machine_id, :category, :value, :workstation_id)
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
