class ApplicationController < ActionController::Base
  before_action -> { @show_navbar = true }
  protect_from_forgery with: :exception
end
