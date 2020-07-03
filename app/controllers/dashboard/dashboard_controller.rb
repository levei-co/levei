class Dashboard::DashboardController < ::ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def index
    @report = DashboardReport.new(current_user)
  end

  def report
    
  end
end
