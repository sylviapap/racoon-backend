class Api::V1::MapEventsController < ApplicationController
    before_action :find_map_event

    def index
        map_events = MapEvent.all
        render json: map_events
    end 

    def show
        map_event = MapEvent.find(params[:id])
        render json: map_event, :include => [:users, :comments  => {:include => :user }]
    end 

    def create
        map_event = MapEvent.create(map_event_params)
        render json: map_event
    end 

    def update
        map_event = MapEvent.find(params[:id])
        map_event.update(map_event_params)
        render json: map_event, :include => [:users => {:include => :map_events}]
    end 

    def find_map_event
        map_event = MapEvent.find(params[:id])
    end

    private
    
    def map_event_params
        params.require(:map_event)
        .permit(:latitude,
            :longitude,
            :title, 
            :address)
    end 

    def query_params
        params.permit(:title)
    end 


end