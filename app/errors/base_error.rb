class BaseError < StandardError

    def initialize(title: nil, detail: nil, status: nil)
        @title = title || I18n.t("errors.base_error.title")
        @detail = detail || I18n.t("errors.base_error.detail")
        @status = status || 500
    end

    def to_h
        {
            error: {
                status: status,
                title: title,
                detail: detail
            }
        }
    end

    def to_json(payload)
      to_h.to_json
    end

    def to_s
      to_h.to_s
    end

    attr_reader :title, :detail, :status

    private

    def get_translated(key, **args)
        I18n.t(text_key(key), **args)
    end

    def text_key(key)
        "errors.#{class_name_underscore}.#{key}"
    end

    def class_name_underscore
        puts @class_name
        @class_name ||= self.class.name.underscore
    end

end