class WelcomeController < ApplicationController
	def index
    @blogblocks=Blogblock.find(:all)
	end
end
