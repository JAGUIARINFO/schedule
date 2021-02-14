class Booking < ApplicationRecord
  belongs_to :user
  validates :datareserva, presence:true
  validates :horareserva, presence:true
end
