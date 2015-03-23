class SensorApiController < ApplicationController

	def getGpsQuestList
		if User.find_by(:userhash => params[:userhash])
			if Gpsquest.count <= 10
				response = {:result => :succeed}
				Gpsquest.all.each{ |quest|
					response[quest.destination] = quest.description
				}
			end
		else
			response = {:result => :failed}
		end
		render :json => response
	end

	def postStep
		Steplog.new(:userhash => params[:userhash],:step => params[:step]).save
		mystep = Step.find(StepUser.find_by(:user_id => User.find_by(:userhash => params[:userhash]).id).step_id)
		response = Hash.new
		if mystep
			addition = params[:step].to_i
			mystep.update(:stock_step => mystep.stock_step + addition ,:total_step => mystep.total_step + addition)
			response = {:result => :succeed,:total_step => mystep.total_step.to_s,:stock_step => mystep.stock_step.to_s}
		else
			response = {:result => :failed}
		end
		render :json => response
	end

	def postLocation
		Gpslog.new(:userhash => params[:userhash],:longitude => params[:longitude].to_f,:latitude => params[:latitude].to_f).save

		lon_threshold = 0.005
		lati_threshold = 0.012

		response = Hash.new
		myuser = User.find_by_userhash(params[:userhash])

		target_quest = Gpsquest.where(:longitude => ((params[:longitude].to_f-lon_threshold)..(params[:longitude].to_f+lon_threshold)),:latitude => ((params[:latitude].to_f-lati_threshold)..(params[:latitude].to_f+lati_threshold))).first

		if(target_quest and myuser)
			target_quest.reward.split(',').each { |reward|
				unless item = ItemsUsers.find_by(:user_id => myuser.id, :item_id => reward.to_i)
					item = ItemsUsers.new
					item.user_id = myuser.id
					item.item_id = reward.to_i
					item.amount = 0
					item.save
				else
					item.amount = item.amount+1
				end
				item.save
			}	
			response = {:result => :succeed}
		else
			response = {:result => :failed}
		end
		render :json => response
	end

	def postQRcode
		Qrlog.new(:userhash => params[:userhash],:code => params[:code]).save()
		response = Hash.new()
		event = Qrevent.find_by(:code => params[:code])
		user = User.find_by(:userhash => params[:userhash])
		if(!event || !user)
			response = {:result => :failed}
		elsif(hasitem = ItemsUsers.find_or_create_by(:item_id => event.reward, :user_id => user.id) {|iu| iu.amount = 0})
			hasitem.amount+=1
			hasitem.save
			response = {:result => :succeed}
		else
			response = {:result => :failed}
		end
		render :json => response
	end

end
