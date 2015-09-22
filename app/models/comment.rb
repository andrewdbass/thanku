class Comment < ActiveRecord::Base
	validates :name, presence: true
	validates :body, presence: true
	validates :person_id, presence: true
end
