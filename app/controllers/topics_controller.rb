class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.order(date: :desc)
    @monthly_topics = []
    this_month_topics = []
    month = 0
    year = 0
    count = 0
    @topics.each do |topic|
      unless month == topic.date.month
        unless @topics.first == topic
          @monthly_topics << [["#{year}","#{month}"],count,this_month_topics]
          this_month_topics = []
        end
        month = topic.date.month
        year = topic.date.year
        count = 0
      end
      this_month_topics << topic
      count = count + 1
      if topic == @topics.last
        @monthly_topics << [["#{year}","#{month}"],count,this_month_topics]
      end
    end
    @topics = @topics.paginate(page: params[:page], per_page: 20)
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :date, :body)
    end
end
