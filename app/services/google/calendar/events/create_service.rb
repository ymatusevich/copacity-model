class Google::Calendar::Events::CreateService < Google::BaseService
  def call
    client.insert_event(CALENDAR_ID, event)
  end

  private

  def event
    Google::Apis::CalendarV3::Event.new.tap do |event|
      event.summary = @params[:summary]
      event.description = 'Event description'
      event.start = { date_time: @params[:start_date].to_datetime.rfc3339, time_zone: Time.zone.name }
      event.end = { date_time: @params[:end_date].to_datetime.rfc3339, time_zone: Time.zone.name }
    end
  end
end
