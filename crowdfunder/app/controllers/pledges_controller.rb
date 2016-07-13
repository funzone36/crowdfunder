class PledgesController < ApplicationController
  
  def index
    @pledges = Pledge.all
  end

  def new
    @pledges = Pledge.new
  end

  def show
    @pledge = Pledge.find(params[:id])
  end

  def create
    @pledge = Pledge.new(pledges_params)

    if @pledge.save
      redirect_to pledges_path
    else
      render :new
    end
  end

  private

  def pledges_params
    params.require(:pleges).permit(:amount)
  end

end
