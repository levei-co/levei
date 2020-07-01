class Dashboard::ReversesController < Dashboard::DashboardController
  before_action :set_reverse, only: %i[ show edit update destroy ]

  def index
    @search = Reverse.reverse_chronologically.ransack(params[:q])

    respond_to do |format|
      format.any(:html, :json) { @reverses = set_page_and_extract_portion_from @search.result }
      format.csv { render csv: @search.result }
    end
  end

  def show
    fresh_when etag: @reverse
  end

  def new
    @reverse = Reverse.new
  end

  def edit
  end

  def create
    @reverse = Reverse.new(reverse_params)
    @reverse.save!

    respond_to do |format|
      format.html { redirect_to @reverse, notice: 'Reverse was successfully created.' }
      format.json { render :show, status: :created }
    end
  end

  def update
    @reverse.update!(reverse_params)
    respond_to do |format|
      format.html { redirect_to @reverse, notice: 'Reverse was successfully updated.' }
      format.json { render :show }
    end
  end

  def destroy
    @reverse.destroy
    respond_to do |format|
      format.html { redirect_to reverses_url, notice: 'Reverse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_reverse
      @reverse = Reverse.find(params[:id])
    end

    def reverse_params
      params.require(:reverse).permit(:user_id, :order_id, :status, :reason)
    end
end
