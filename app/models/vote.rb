class Vote < ActiveRecord::Base

	belongs_to :link, dependent: :destroy

#	def up_vote(link, user)

#	end

end
