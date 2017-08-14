class ApplicationController < ActionController::Base
  before_action -> { @show_navbar = true }
  before_action -> { @title = "Let's Rails" }
  protect_from_forgery with: :exception
end
