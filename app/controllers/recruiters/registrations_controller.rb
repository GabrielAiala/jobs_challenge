# frozen_string_literal: true

class Recruiters::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if request.method == "POST" && resource.persisted?
      @resource = resource
      render 'recruiters/registration/create', status: :ok
    elsif request.method == "DELETE"
      @resource = resource
      render 'recruiters/registration/delete', status: :ok
    else
      render 'recruiters/registration/error', status: :unauthorized
    end
  end
end
