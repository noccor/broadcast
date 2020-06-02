class Broadcast < ActiveRecord::Base
  validates :title, presence: true
  validates :broadcast_date, presence: true
end
