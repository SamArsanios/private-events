class EventsController < ApplicationController
    def index
        @events = Event.all
    end
    
    def new
        @event= Event.new
    end

    def show
        @event= Event.find(params[:id])
    end
    
    def create
        @event = User.find(session[:id]).created_events.build(event_params)
        if @event.save
            redirect_to @event
        else
            render :new
        end
    end

   def add
    @event = Event.find(params[:id])
    @event.atendees << User.find(session[:id])
    redirect_to @event
   end

   private 

   def event_params
      params.require(:event).permit(:event_name,:event_description,:location,:event_date)
   end
end                                      