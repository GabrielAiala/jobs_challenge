# frozen_string_literal: true

class Recruiters::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    @resource = resource
    render 'recruiters/session/create', status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render 'recruiters/session/delete', status: :ok
    else
      render 'recruiters/session/error', status: :unprocessable_entity
    end
  end
end
