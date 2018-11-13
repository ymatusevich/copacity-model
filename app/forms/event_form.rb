class EventForm
  include ActiveModel::Model

  attr_accessor :start_date, :end_date, :html_link, :status, :summary,
                :creator_name, :creator_email, :type

  validates_presence_of :start_date, :end_date, :creator_email, :summary

  def initialize(params = {})
    @start_date    = params[:start_date]
    @end_date      = params[:end_date]
    @html_link     = params[:html_link]
    @status        = params[:status]
    @summary       = params[:summary]
    @creator_name  = params[:creator_name]
    @creator_email = params[:creator_email]
    @type          = params[:type]
  end

  def submit
    @type.humanize.safe_constantize.new.tap do |event|
      event.start_date    = @start_date
      event.end_date      = @end_date
      event.html_link     = @html_link
      event.status        = @status
      event.summary       = @summary
      event.creator_name  = @creator_name
      event.creator_email = @creator_email
    end.save
  end
end
