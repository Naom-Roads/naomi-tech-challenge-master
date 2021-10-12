class MetricsController < ApplicationController
  #TODO it's common (though not required) to have search be a part of the index page, with the default being 'all' and any search constraints being params.
  # This lets us stay within resourceful routing patterns nicely and means less non-standard route names to remember



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
  # end

  def create
    if @verify_uuid_format != true
      render json: nil, status:400
      return
    end
    if metric_params[:category].empty? || metric_params[:value].empty?
      render json: nil, status: 400
      return
    end

    metric = Metric.find_by(machine_id: metric_params[:machine_id], category: metric_params[:category], value: metric_params[:value])

    if metric
      metric.update(value: metric_params[:value])
      render json: metric.to_json, status: 200

    else
      metric = Metric.new()
      metric.save
      render json: metric.to_json, status: 201
    end
  end

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
