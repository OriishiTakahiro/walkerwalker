class GameApiController < ApplicationController

	before_action :authoriseUser

	# get from server
	def getItemEntity
		unless @response[0]
			@response.push(:result => :succeed)
			hasitem = ItemsUsers.where(:user_id => @user.id)
			Item.all.each { |item|
				hasitem = ItemsUsers.find_by(:user_id => @user.id, :item_id => item.id)
				@response.push([:id => item.id, :name => item.name, :effective_term => item.effective_term, :effective_value => item.effective_value, :description => item.description, :amount => hasitem ? hasitem.amount : 0])
			}
		end
		render :json => @response
	end

	def getStep
		if mystep = Step.find_by(:id => @user.id)
			@response = {:result => :successed, :step => mystep.stock_step, :total_step => mystep.total_step}
		end
		render :json => @response
	end

	# get from unity game

	# utility
	def authoriseUser
		@response = Array.new
		unless @user = User.find_by(:userhash => params[:userhash], :validities => true)
			@response.push(:result => :failed ,:message => "Requested userhash is illegal.")
		end
	end

end
