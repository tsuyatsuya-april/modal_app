class Event < ApplicationRecord
  has_many :schedule
  has_many :shop
end
