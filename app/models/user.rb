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
		mobile.length == 10		
	end

	def method1
		
	end

	def method2
		
	end

	def method3
		
	end

	def method4
		
	end

	def method5
		
	end

	def method6
		
	end

	def method7
		
	end

	def method8
		
	end

	def method9
		
	end
end
