class Dashboard::DashboardController < ::ApplicationController
  layout 'dashboard'
  # before_action :authenticate_user!

  def index
    @search = Reverse.reverse_chronologically.ransack(params[:q])
    @reverses = set_page_and_extract_portion_from @search.result

    @report = DashboardReport.new(User.last)
  end

  def report
    
  end
end
