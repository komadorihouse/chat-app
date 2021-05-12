class RoomUser < ApplicationRecord
  belongs_to :users
  belongs_to :room
end
