class CensorApiController < ApplicationController

	def postLocation
		Gpslog.new(:userhash => params[:userhash],:longitude => params[:longitude].to_f,:latitude => params[:latitude].to_f).save

		lon_threshold = 0.005
		lati_threshold = 0.012

		response = Hash.new
		myuser = User.find_by_userhash(params[:userhash])

		target_quest = Gpsquest.where(:longitude => ((params[:longitude].to_f-lon_threshold)..(params[:longitude].to_f+lon_threshold)),:latitude => ((params[:latitude].to_f-lati_threshold)..(params[:latitude].to_f+lati_threshold))).first

		if(target_quest and myuser)

			new_item = ItemsUsers.new
			new_item.user_id = myuser.id
			new_item.item_id = target_quest.reward
			new_item.save

			response = {:result => :successed}
		else
			response = {:result => :failed}
		end
		render :json => response
	end

	def postQRcode
		Qrlog.new(:userhash => params[:userhash],:code => params[:code]).save()
		response = Hash.new()
		event = Qrevent.find_by_code(params[:code])
		user = User.find_by_userhash(params[:userhash])
		if(!event || !user)
			response = {:result => :failed}
		elsif(ItemsUsers.new(:item_id => event.reward, :user_id => user.id).save)
			response = {:result => :successed}
		else
			response = {:result => :failed}
		end
		render :json => response
	end

end
