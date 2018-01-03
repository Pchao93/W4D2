class KatsController < ApplicationController
  def index
    @kats = Kat.all
    if @kats.empty?
      redirect_to new_kat_url
    else
      render :index
    end
  end

  def show
    @kat = Kat.find_by(id: params[:id])
    if @kat
      render :show
    else
      redirect_to new_kat_url
    end
  end

  def new
    @kat = Kat.new
    render :new
  end

  def edit
    @kat = Kat.find_by(id: params[:id])
    #params = {id: 1, action: get, controller: kats, kat: {name: brian}}
    if @kat.persisted?
      render :edit
    else
      redirect_to new_kat_url
    end
  end

  def create
    @kat = Kat.new(kat_params)

    if @kat.save
      redirect_to kat_url(@kat)
    else
      render :new
    end
  end

  def update
    @kat = Kat.find_by(id: params[:id])

    if @kat.update(kat_params)
      redirect_to kat_url(@kat)
    else
      render :edit
    end
  end

  private

  def kat_params
    params.require(:kat).permit(:birth_date,:color,:name,:sex,:description)
  end
end
