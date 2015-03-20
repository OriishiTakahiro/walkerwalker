#coding:utf-8
class ApiController < ApplicationController

	#under for connect by android 

	def addStep
		Steplog.new(:userhash => params[:userhash],:step => params[:step]).save
		mystep = Step.find(StepUser.find_by(:user_id => User.find_by(:userhash => params[:userhash]).id).step_id)
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



	def getGpsQuestList
		render :json => Gpsquest.all
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
