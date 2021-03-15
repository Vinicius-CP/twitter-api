class Api::V1::ApiController < ActionController::API
  rescue_from Exception, with: :exception_handler

  def exception_handler(exception)
    case exception
    when ActionController::UnknownFormat, ActionController::InvalidCrossOriginRequest
      render json: { message: 'Bad request' }, status: :unprocessable_entity
    when ActiveRecord::RecordNotFound, ActionController::RoutingError 
      render json: { message: 'Not found' }, status: :not_found
    else
      render json: { message: 'Internal error' }, status: :internal_server_error
    end
  end
end
