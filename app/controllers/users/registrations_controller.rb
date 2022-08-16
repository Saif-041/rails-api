class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json
    before_action :authenticate_user!
    
    private

    def respond_with(resource, _opts = {})
      byebug
      resource.persisted? ? register_success : register_failed
    end

    def register_success
      render json: { message: 'Signed up suucessfully!', status: 200 }, status: :ok
    end

    def register_failed
      render json: { message: "User Already Exists.", status: 500 }, status: :ok
    end

  end
