class GameApiController < ApplicationController

	before_action :authoriseUser

	def getItemEntity
		unless @response[0]
			@response.push(:result => :succeed)
			hasitem = ItemsUsers.where(:user_id => @user.id)
			Item.all.each { |item|
				@response.push([:id => item.id, :name => item.name, :effective_term => item.effective_term, :effective_value => item.effective_value, :description => item.description])
			}
		end
		render :json => @response
	end

	def authoriseUser
		@response = Array.new
		unless @user = User.find_by(:userhash => params[:userhash])
			@response.push(:result => :failed)
		end
	end

end
