class EventsGuestsController < ApplicationController

    def create
        @events_guest = EventsGuest.new(events_guest_params)

        if @events_guest.save
            redirect_to @events_guest.attended_event
        else
            redirect_back (root_path)
        end
    end

    def destroy
        @events_guest = EventsGuest.find(params[:id])
        @events_guest.destroy
        redirect_to root_path
    end

    private
    def events_guest_params
        params.require(:events_guest).permit(:id, :attended_event_id, :guest_id)
    end
end