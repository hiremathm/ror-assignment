class User < ApplicationRecord
	validates :name, :mobile, :email, presence: true
	validates :email, uniqueness: true
	validates :mobile, numericality: true, length: {is: 8}
end
