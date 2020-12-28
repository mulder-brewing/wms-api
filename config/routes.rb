Rails.application.routes.draw do
  post "/signup", to: "accounts#signup"
end
