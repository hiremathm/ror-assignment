class Slot < ApplicationRecord
	validates :start_time, :end_time, :total_capacity, presence: true

	has_many :slot_collections, dependent: :destroy
end
