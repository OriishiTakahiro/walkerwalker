#coding:utf-8
class ApiController < ApplicationController

	def get_list
		render :json => User.all
	end

	#under for connect by android 
	
	def registerUser
		response = Hash.new
		
		if params[:name] != nil and params[:pass] != nil
			unless User.where(:name).empty?
				response = {:result => :failed,:message => "specified name is already existing"}
				render :json => response
				return nil
			end

			user = User.new
			user.name = params[:name]
			user.pass = params[:pass]
			while user.userhash == nil do
				tmp = ((1..9).to_a + ('a'..'z').to_a).sample(25).join
				user.userhash = tmp if User.where(:userhash => tmp).empty?
			end

			mystep = Step.new
			mystep.save
			user.step_id = mystep.id

			user.save

			response = {:result => :successed ,:message =>"registered use name = #{params[:name]}" ,:userhash => user.userhash} 

		else
			response = {:result => :failed,:message => "lack of information for register new user"}
		end

		render :json => response

	end

	def getUserhash
		response = Hash.new
		users = User.where(:name => params[:name],:pass => params[:pass])
		if users.empty?
			response[:result] = "failed" 
		else
			response[:result] = "success"
			response[:userhash] = users.first.userhash 
		end

		render :json => response
	end

	def addStep
		Steplog.new(:userhash => params[:userhash],:step => params[:step]).save
		mystep = Step.find(StepUser.find_by_user_id(User.find_by_userhash(params[:userhash]).id).step_id)
		response = Hash.new
		if mystep
			addition = params[:step].to_i
			mystep.update(:stock_step => mystep.stock_step + addition ,:total_step => mystep.total_step + addition)
			response = {:result => :successed,:total_step => mystep.total_step.to_s,:stock_step => mystep.stock_step.to_s}
		else
			response = {:result => :failed}
		end
		render :json => response
	end

	def getStep
		response = Hash.new
		mystep = Step.find(User.where(:userhash => params[:userhash]).first.step_id)
		if mystep
			response = {:result => :successed,:step => mystep.stock_step.to_s,:total_step => mystep.total_step.to_s}
		else
			response = {:result => :failed,:message => 'userhash is no match'}
		end
		render :json => response
	end

	def getGpsQuestList
		render :json => Gpsquest.where(:flag => 1)
	end

	def postLocation
		threshold = 0.1
		response = Hash.new
		myuser = User.where(:userhash => params[:userhash]).first
		target_quest = Gpsquest.find(params[:id].to_i)

		log = Gpslog.new
		log.userhash = params[:userhash]
		log.longitude = params[:longitude].to_f
		log.latitude = params[:latitude].to_f

		if((target_quest.latitude - params[:latitude].to_f).abs <= threshold and (target_quest.longitude - params[:longitude].to_f).abs <= threshold and myuser != nil)

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
		response = Hash.new()
		myuser = User.where(:userhash => params[:userhash])
		unless(myuser.empty?)
			items = Qrevent.where(:code => params[:code]).map{|x| return x.cord}.join(",")
			response = {:result => :successed,:items => items}
		else
			response = {:result => :successed}
		end
	end

	#under for connect by administrator
	
	def newData(object,setlist)
		if params[:pass] == 'hr16vayd7lx8ktnusme5'
			eval(
				<<-EOS
					obj = #{object}.new()
					#{setlist.map{|x| "obj.#{x} = params[:#{x}]\n"}.join}
					obj.save

					render :text => "successed"
				EOS
			)
		else
			render :text => "failed! unmatched password"
		end
	end

	def newLotRate
		newData('Lotrate',['table_id','item_id','probability'])
	end

	def newGpsQuest
		newData('Gpsquest',['flag','lot_table','destination_latitude','destination_longitude'])
	end

	def newQRevent
		newData('Qrevent',['cord','reward_id'])
	end
end
