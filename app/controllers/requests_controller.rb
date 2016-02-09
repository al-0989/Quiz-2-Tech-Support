class RequestsController < ApplicationController

  before_action :find_request, only: [:show, :edit, :update, :destroy, :status]
  # show all the requests available
  def index
    @request = Request.all.sort_by_status
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(req_params)
    if @request.save
      redirect_to request_path(@request), notice: "Thanks for submitting a request!"
    else
      flash[:alert] = "Request failed. Please try again"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @request.update req_params
      redirect_to requests_path(@request), notice: "Request successfully updated"
    else
      flash[:alert] = "Request update failed. Try again."
      render :edit
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_path, notice: "Request successfully deleted."
  end

  def status
    if @request.status == "Un-done"
      @request.update status: "Done"
      redirect_to requests_path, notice: "Request marked done"
    else
      @request.update status: "Un-done"
      redirect_to requests_path, notice: "Request marked un-done"
    end
  end

def search
  @request = Request.wildcard_search(params[:id])
end

  private

  def req_params
    req_params = params.require(:request).permit(:name,:email,:department,:message)
  end

  def find_request
    @request = Request.find(params[:id])
  end
end
