class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index 
        render json: Camper.all
    end

    def show 
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperShowSerializer
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private 

    def camper_params 
        params.permit(:name, :age)
    end

    def render_not_found
        render json: {error: "Camper not found"}, status: :not_found
    end

    def render_record_invalid(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end

end
