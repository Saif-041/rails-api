class Users::SessionsController < Devise::SessionsController
    respond_to :json

    def new
        flash.clear
        super
    end

    private
    def respond_with(resource, _opts = {})
    #var abc = response.headers.get("Authorization")
      #var jsonData = JSON.parse(Headers.Authorization);
    # pm.setEnvironmentVariable("token",jsonData.message.token);
        #var token2: :zbzbzbz
    render json: { message: 'Logged in successfully.', data: resource }, status: :ok
    end
    def respond_to_on_destroy
      !current_user.present? ? log_out_success : log_out_failure
    end
    def log_out_success
      render json: { message: "Logged out." }, status: :ok
    end
    def log_out_failure
      render json: { message: "Logged out failure."}, status: :unauthorized
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