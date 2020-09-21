class EventsController < ApplicationController
  def index
    @events = Event.all.order(id: 'DESC')
  end

  def new
    @event = EventScheduleShop.new
  end

  def create
    @event = EventScheduleShop.new(event_schedule_shop_params)
    if @event.valid?
      @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end
  private

  def event_schedule_shop_params
    params.require(:event_schedule_shop)
           .permit(:name, :description, :savetime, 
                  :savedate, :event_id, :shop_name, 
                  :shop_url, :map_url, :comment)
  end
end
