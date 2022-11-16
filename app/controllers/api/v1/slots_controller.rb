class ::Api::V1::SlotsController < Api::ApplicationController
	include SlotCollectionConcern #this concern performs the slot collection input validation and constructing response

	before_action :valitate_inputs, only: :create

	def index
		slots = Slot.all
		render json: slots
	end

	def create
		slot = Slot.new(slots_params)
		#converting time to IST, because time is getting saved in UTC format
		slot.start_time = slot.start_time + 5.hours + 30.minutes
		slot.end_time = slot.end_time + 5.hours + 30.minutes
		if slot.save
		  SlotCollectionCreator.call(slot) #call service object for creating slot collections
		  response = construct_response slot
	      render json: response, status: :created
	    else
	      render json: slot.errors, status: :unprocessable_entity
		end
	end

	private 
	def slots_params
		params.require(:slot).permit(:start_time, :end_time, :total_capacity)
	end
end
