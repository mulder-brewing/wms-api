class RoutingError < BaseError

    def initialize(path)
        super(
            title: get_translated(:title),
            detail: get_translated(:detail, path: path),
            status: :not_found
        )
    end

end