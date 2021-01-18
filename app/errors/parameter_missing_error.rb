class ParameterMissingError < BaseError

    def initialize(error)
        super(
            title: get_translated(:title),
            detail: error.message,
            status: :bad_request
        )
    end

end