class User < ApplicationRecord
	validates :name, :mobile, :email, presence: true
	validates :email, uniqueness: true
	validates :mobile, numericality: true
end
