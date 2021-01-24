Rails.application.routes.draw do
  post "/signup", to: "accounts#signup"
  post "/signin", to: "accounts#signin"
end
