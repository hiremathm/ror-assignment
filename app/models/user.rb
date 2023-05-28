class User < ApplicationRecord
	REGEX_PATTERN = /^(.+)@(.+)$/ 

	validates :name, :mobile, :email, presence: true
	validates :email, uniqueness: true
	validates :mobile, numericality: true, length: {is: 8}
	validates_with :validates_email
	#custom validation methods
	def validates_email
		email =~ REGEX_PATTERN
	end

	def validates_mobile_number_with_length_10
		mobile.length == 9		
	end
end
