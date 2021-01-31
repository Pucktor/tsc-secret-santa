class EventsController < ApplicationController
    def new
        @event = Event.new
        @participant = Participant.new
    end

    def create
        @event = Event.create(event_params(:title, :amount))
        if @event.save
            redirect_to event_path(@event)
        else
            render 'new'
        end
    end

    def show
        @event = Event.find(params[:id])
        @participant = Participant.new        
    end

    def update
        @event = Event.find(params[:id])
        @event.update(event_params(:title, :amount))
        @event.update_status
        redirect_to event_path(@event)
    end

    def event_params(*args)
        params.require(:event).permit(*args)
    end
end
