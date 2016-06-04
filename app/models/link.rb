class Link < ActiveRecord::Base

	has_many :votes, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :title, presence: true, length: { in: 2..50 }
	validates :link, presence: true, length: { in: 2..255 }

	# Finds or creates a upvote
	def up_vote(user)
		vote = Vote.find_or_initialize_by(user_id: user.id, link_id: self.id)
		vote.update_attribute(:up_vote, true)
	end

	# Finds or creates a downvote
	def down_vote(user)
		vote = Vote.find_or_initialize_by(user_id: user.id, link_id: self.id)
		vote.update_attribute(:up_vote, false)
	end

end
