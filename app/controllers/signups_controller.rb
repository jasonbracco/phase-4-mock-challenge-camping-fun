class SignupsController < ApplicationController

    def create
        signup=Signup.create!(time: params[:time], camper_id: params[:camper_id], activity_id: params[:activity_id])
        render json: signup.activity, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

end
