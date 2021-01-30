class ErrorsController < ApplicationController

    def error_404
        raise RoutingError.new request.path;
    end

end