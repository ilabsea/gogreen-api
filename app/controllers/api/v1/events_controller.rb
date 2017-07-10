module Api::V1
  class EventsController < ApplicationController
    protect_from_forgery with: :null_session, if: ->{request.format.json?}
    skip_before_filter  :verify_authenticity_token

    def index
      events = Event.all
      render json: {:events => events}
    end

    def create
      event = Event.new(event_params)
      if event.save
        render json: event, status: :created
      else
        render json: event.errors.messages, status: :unprocessable_entity
      end
    end

    private
    def event_params
      params.require(:event).permit(:title, :location, :description, :start_date, :end_date,
                    :start_time, :end_time, :facebook_link, :image)
    end
  end
end
