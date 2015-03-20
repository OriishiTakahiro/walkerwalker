#coding:utf-8
class ApiController < ApplicationController

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
