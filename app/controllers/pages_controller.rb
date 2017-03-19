class PagesController < ApplicationController
  def index
    redirect_to new_ticket_path if logged_in?
  end
end
