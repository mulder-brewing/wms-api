class Auth::PleaseLoginError < BaseError

    def initialize(error)
        super(
            title: get_translated(:title),
            detail: get_translated(:detail),
            status: :unauthorized
        )
    end

end