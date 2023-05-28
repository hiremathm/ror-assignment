class User < ApplicationRecord
	validates :name, :mobile, :email, presence: true
	validates :email, uniqueness: true
	validates :mobile, numericality: true, length: {is: 8}
	validates_with :validates_email
	#custom validation methods
	def validates_email
	 	
	end 
end
