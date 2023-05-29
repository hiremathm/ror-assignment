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
		"dont return mehotd 1"
	end

	def method2
		"dont return method 2"
	end

	def method3
		return "test method 3"
	end

	def method4
		return "method 4"
	end

	def method5
		return "method 5"
	end

	def method6
		return "method 6"
	end

	def method7
		return "method 7"
	end

	def method_8
		return "method 8"
	end

	def method_9
		return "method 9"
	end

	def method_10
		return "method 10"
	end
end
