class Users::SessionsController < Devise::SessionsController
    respond_to :json

    def new
        flash.clear
        super
    end

    private

    def respond_with(resource, _opts = {})
      if resource.errors.any?
        render json: { message: "Some errors.", status: 401, token: '', data: '' }, status: :ok
      else
        render json: { message: 'Logged in successfully.', status: 200, token: '' data: resource }, status: :ok
      end
    end
    
    def respond_to_on_destroy
      current_user.present? ? log_out_failure : log_out_success
    end
    def log_out_success
      render json: { message: "Logged out sucessfully.", status: 200 }, status: :ok
    end
    def log_out_failure
      render json: { message: "Logged out failure.", status: 401 }, status: :ok
    end

    #def jsonResponse
        # request.headers['Authorization'].split(' ').last
        #request.headers['Authorization']
        #@response.body
        #User.find(params[:id])
    #end
    # def bearer_token
    #     pattern = /^Bearer /
    #     header  = request.headers['Authorization']
    #     header.gsub(pattern, '') if header && header.match(pattern)
    #   end
  end