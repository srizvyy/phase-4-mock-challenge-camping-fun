class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid

    def create 
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    private 

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def render_record_invalid(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end

end
