json.array! @events do |event|
  json.start event.start_date
  json.end   event.end_date
  json.title event.summary
end
