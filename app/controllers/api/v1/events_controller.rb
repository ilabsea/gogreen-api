module Api::V1
  class EventsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      events = Event.order('created_at DESC').paginate(page: params[:page])

      render json: events
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
      params.require(:event).permit(:title, :location, :description, :date,
                    :start_time, :end_time, :facebook_link, :image, :user_id)
    end
  end
end
