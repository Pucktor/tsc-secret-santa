class MatchesController < ApplicationController
    def new
        @matches = Match.new
        @event = Event.find(params[:event_id])
        if @event.matches.any?
            redirect_to event_match_url(@event)
        end
        update
    end

    def show
        @event = Event.find(params[:event_id])
        if @event.matches.empty?
            redirect_to new_event_match_url
        end       
    end

    def update
        @event = Event.find(params[:event_id])
        order = @event.match_order
        if @event.matches.any?
          redirect_to event_match_url(@event)
          return
        end
        send_matches(order)
    end

    def send_matches(order)
        order.each do |couple|
            match = Match.new(giver: couple[0], receiver: couple[1])
            @event.matches << match
            match.save
        end
        @event.matches.each do |match|
            match.send_email
        end
    end
end
