class Comment < ActiveRecord::Base

	belongs_to :link
	belongs_to :user

	validates :text, presence: true, length: { minimum: 2  }

end
