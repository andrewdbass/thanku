class Person < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validates :bio, presence: true
end
