class NotFoundError < BaseError

    def initialize(error)
        super(
            title: get_translated(:title),
            detail: get_translated(:detail),
            status: :not_found
        )
    end

end