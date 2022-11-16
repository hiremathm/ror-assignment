module SlotCollectionConcern
  extend ActiveSupport::Concern
  def construct_response slot
  	{
		slot: {
			id: slot.id,
			start_time: slot.start_time,
			end_time: slot.end_time,
			total_capacity: slot.total_capacity,
			slot_collections: slot.slot_collections
		}
	}
  end

  def valitate_inputs
		input = params[:slot]
		start_time = input[:start_time]
		end_time = input[:end_time]
		total_capacity = input[:total_capacity]

		if start_time.nil? || end_time.nil?
			render json: {error: {message: "start time/end time is required or must present"}}, status: 422 and return
		end

		if total_capacity.nil?
			render json: {error: {message: "total_capacity is required or must present"}}, status: 422 and return
		elsif total_capacity.class == Float
			render json: {error: {message: "total_capacity can accept only integer value"}}, status: 422 and return
		end 

		start_time = DateTime.parse input[:start_time]
		end_time = DateTime.parse input[:end_time]

		if start_time < DateTime.now || end_time < DateTime.now
			render json: {error: {message: "start time/end time must be greater than current time"}}, status: 422 and return
		elsif start_time > end_time
			render json: {error: {message: "start time must be less than end time"}}, status: 422 and return
		end		
	end
end