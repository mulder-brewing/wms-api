module ErrorHandler
    extend ActiveSupport::Concern

    ERRORS = {
        "ActionController::ParameterMissing" => "ParameterMissingError",
        "ActiveRecord::RecordInvalid" => "InvalidModelError",
        "ActiveRecord::RecordNotFound" => "NotFoundError"
    }

    included do
        rescue_from(StandardError, with: lambda { |e| handle_error(e) })
    end

    private

    def handle_error(e)
        mapped = map_error(e)
        # notify about unexpected_error unless mapped
        mapped ||= BaseError.new
        render_error(mapped)
    end

    def map_error(e)
        return e if e.is_a?(BaseError)

        # otherwise, try to map the error
        ERRORS[e.class.name]&.constantize&.new(e)
    end

    def render_error(error)
        render json: error, status: error.status
    end
    
end