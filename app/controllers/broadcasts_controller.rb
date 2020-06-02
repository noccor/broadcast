class BroadcastsController < ApplicationController
  before_action :set_broadcast, only: [:show, :update, :destroy]

  def index
    @broadcasts = Broadcast.all

    render json: @broadcasts
  end

  def show
    render json: @broadcast
  end

  def create
    @broadcast = Broadcast.new(broadcast_params)

    if @broadcast.save
      render json: @broadcast, status: :created, location: @broadcast
    else
      render json: @broadcast.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @broadcast.destroy
  end

  private
    def set_broadcast
      @broadcast = Broadcast.find(params[:id])
    end

    def broadcast_params
      params.require(:broadcast).permit(:title, :broadcast_date, :created_at, :subscriptions_count)
    end
end
