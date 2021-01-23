Rails.application.routes.draw do
  post "/signup", to: "accounts#signup"
  post "/login", to: "accounts#login"
end
