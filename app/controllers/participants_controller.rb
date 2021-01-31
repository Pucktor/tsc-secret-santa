class ParticipantsController < ApplicationController
    def new
        @event = Event.find(params[:event_id])
        @participant = Participant.new
    end

    def create
        @event = Event.find(params[:event_id])
        @participant = Participant.new(participant_params)
        @participant.event = @event
        if @participant.save
            redirect_to event_path(@event)
        else
            render 'events/show'
        end
    end

    def destroy
        @participant = Participant.find(params[:id])
        @participant.destroy
        redirect_to event_path(@participant.event)
    end

    private

    def participant_params
        params.require(:participant).permit(:name, :email)
    end
end
