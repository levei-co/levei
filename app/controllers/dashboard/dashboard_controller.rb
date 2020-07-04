class Dashboard::DashboardController < ::ApplicationController
  layout 'dashboard'
  
  before_action :authenticate_user!
  before_action :set_report

  def index
  end

  def report
  end

  private

  def set_report
    @report = DashboardReport.new(current_user)
  end
end
