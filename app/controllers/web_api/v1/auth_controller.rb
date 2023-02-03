require 'jwt_manager'
class WebApi::V1::AuthController < WebController
  skip_before_action :authenticate_user
  def login
    run WebApi::Authentication::Operation::Login do |ctx, _params: params, **|
      render json: ctx[:resp], status: :ok
      return
    end
    render json: { error: 'Invalid credentials' }, status: :unauthorized
  end

  def signup
    result = WebApi::Authentication::Operation::Signup.(params: params[:user] )
    
    if result.success?
      render nothing: true, status: :created
      return
    else
      render json: { errors: result[:"contract.default"].errors.messages.as_json, message: "unable to create user, check errors" }, status: :bad_request
      return
    end
  end

  private

  def _run_options(ctx)
    ctx.merge(current_user: current_user)
  end

end
