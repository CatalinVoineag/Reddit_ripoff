class Link < ActiveRecord::Base

	validates :title, presence: true, length: { in: 2..50 }
	validates :link, presence: true, length: { in: 2..255 }



end
