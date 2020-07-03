class HomeController < ApplicationController
  def index
    redirect_to controller: 'dashboard/dashboard', action: :index
  end
end
