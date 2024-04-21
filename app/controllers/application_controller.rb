class ApplicationController < ActionController::API
  include JwtToken
  before_action :authorized, except: [:create]
end