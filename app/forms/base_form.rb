class BaseForm
    include ActiveModel::Model

    attr_writer :errors_response

    validate :models_valid

    def errors_response
        @errors_response ||= {}
    end

    def validate(*models)
        models.each do |model|
            unless model.valid?
                errors_response[model.model_name.human] = model.errors
            end
        end
    end


end