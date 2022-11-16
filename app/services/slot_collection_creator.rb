class SlotCollectionCreator < ApplicationService
  attr_reader :slot
  def initialize slot
	@slot = slot  	
  end

  def call
	minutes = ( (@slot.end_time-@slot.start_time) / 60).round
	slot_time = 15
	i = 15
	collections = []
	previous_slot_end_time = nil
	total_capacity = @slot.total_capacity
	number_of_slots = minutes / slot_time

	capacity = total_capacity / number_of_slots
	reminder = total_capacity % number_of_slots
	
	while i <= minutes

		start_time = previous_slot_end_time.present? ? previous_slot_end_time : @slot.start_time
		end_time = start_time + slot_time.minutes
	
		slot_collection = {
			slot_id: @slot.id,
			capacity: capacity,
			start_time: start_time,
			end_time: end_time,
		}
		collections << slot_collection
		previous_slot_end_time = end_time
		i += slot_time
	end

	reminder.times do |i| 
		i += 1
		collections[collections.length - i][:capacity] += 1
	end

	@slot.slot_collections.create(collections)	
  end
end