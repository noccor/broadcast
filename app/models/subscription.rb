class Subscription < ActiveRecord::Base
  belongs_to :broadcast

  validates :broadcast_id, presence: true
  validates :email, presence: true
  validates :firstname, presence: true
  validates :surname, presence: true
end
on
