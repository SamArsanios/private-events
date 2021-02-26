module EventsHelper
    def display_attendees
        names = ''
        @event.atendees.each do |atendee|
            names << (content_tag :p, (link_to atendee.name, atendee))
        end
        names.html_safe
    end

    def display_events(events)
        events_names = ''
        events.each do |event|
            events_names << (content_tag :p, (link_to event.event_name, event))
        end      
       events_names.html_safe  
    end
end

