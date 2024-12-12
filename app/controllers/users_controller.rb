class UsersController < ApplicationController
  def library
    library = Rails.cache.fetch("user_#{params[:id]}_library", expires_in: 6.hours) do
      User.find(params[:id]).books
    end
    render json: library
  end
end
