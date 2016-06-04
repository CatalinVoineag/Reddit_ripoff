module LinksHelper

	# Counts likes of a link
	def likes(link)
		likes = link.votes.where(up_vote: true).count
	end

	# Counts dislikes of a link
	def dislikes(link)
		dislikes = link.votes.where(up_vote: false).count
	end


end
