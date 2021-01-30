Rails.application.routes.draw do

    namespace :auth do
        controller :accounts do
            post :sign_up
            post :sign_in
        end

        controller :jwt do
            get :auth_check
        end
    end

    match '*path' => 'errors#error_404', via: :all

end
