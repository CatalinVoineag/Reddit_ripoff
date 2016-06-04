class VotesController < ApplicationController

	def new
		byebug
		@vote = Vote.new
	end

	def create
		byebug
		@vote = Vote.new(vote_params)
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

		def vote_params
			params.require(:vote).permit(:link_id, :user_id)
		end

end
