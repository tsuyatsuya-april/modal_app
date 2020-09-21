class EventScheduleShop
  include ActiveModel::Model
  attr_accessor :name, :description, :savetime, :savedate, :event_id, :shop_name, :shop_url, :map_url, :comment
  with_options presence: true do
    validates :name
    validates :savetime
    validates :savedate
    validates :shop_name
  end

  def save
    event = Event.create(name: name, description: description)
    Schedule.create(savedate: savedate, savetime: savetime, event_id: event.id)
    Shop.create(shop_name: shop_name, shop_url: shop_url, map_url: map_url, comment: comment, event_id: event.id)
  end
end
