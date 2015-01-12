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
				tmp =  (0..25).map{('a'..'z').to_a[rand(26)]}.join
				user.userhash = tmp if User.where(:userhash => tmp).empty?
			end

			mystep = Step.new
			mystep.save
			user.step_id = mystep.id

			user.save

			response = {:result => :successed ,:message =>"registered use name = \"#{params[:name]}\"" ,:userhash => user.userhash} 

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
		mystep = Step.where(:userhash => params[:userhash])
		response = Hash.new
		unless mystep.empty?
			mystep.update(:stock_step => mystep.stock_step + params[:step],:total_step => mystep.total_step)
			response = {:result => :successed,:total_step => mystep.total_step.to_s}
		else
			response = {:result => :failed}
		end
		render :json => response
	end

	def getStep
		response = Hash.new
		mystep = Step.where(:userhash => params[:userhash])
		unless mystep.empty?
			response = {:result => :successed,:step => mystep.step.to_s,:total_step => mystep.total_step.to_s}
		else
			response = {:result => :failed}
		end
	end

	def getGpsQuestList
		questlist = Gpsquest.where(:flag => 1).map{|x| return {:id => x.id , :destination => x.destination}}
		render :json => questlist
	end

	def postPosition
		response = Hash.new
		myuser = User.where(:userhash => params[:userhash])
		target_quest = Gpsquest.where(:id => params[:id].to_i)

		if((target_quest.destination_latitude - params[:destination_latitude].to_f).abs <= threshold and (target_quest.destination_latitude - params[:destination_latitude].to_f).abs <= threshold and !(myuser.empty?))
			reward_list = Lotrate.where(:table_id => target_quest[:lot_table].to_i).map{|x| return rand(101) < x.probability ? x.item_id : nil}.delete(nil).join(",")
			myuser.update(:stock_item => myuser.stock_item + "," + reward_list)
			response = {:result => :successed,:items => reward_list}
		else
			response = {:result => :failed}
		end
		render :json => response
	end

	def postQR
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
