class Broadcast < ActiveRecord::Base
  has_many :subscriptions
  
  validates :title, presence: true
  validates :broadcast_date, presence: true
end
