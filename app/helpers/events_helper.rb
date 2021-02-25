module EventsHelper
    def display_events(events)
        events_names = ''
        events.each do |event|
            events_names << (content_tag :p, (link_to event.event_name, event))
        end        
    end
end

