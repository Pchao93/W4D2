class CatRentalRequestsController < ApplicationController

  def new
    @request = CatRentalRequest.new
    @kats = Kat.all

    render :new
  end

  def create
    @request = CatRentalRequest.new(request_params)
    @kats = Kat.all

    if @request.save
      redirect_to kat_url(@request.cat_id)
    else
      render :new
    end

  end

  private

  def request_params
    params.require(:request).permit(:cat_id, :start_date, :end_date)
  end

end
