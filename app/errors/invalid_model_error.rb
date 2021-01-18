class InvalidModelError < BaseError

    def initialize(error)
        model = error.record
        super(
            title: get_translated(:title, model: model.model_name.human),
            detail: model.errors.full_messages.to_sentence,
            status: 422
        )
    end

end