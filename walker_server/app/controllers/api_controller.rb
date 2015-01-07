class ApiController < ApplicationController

	#CSRF対策,これがないとAPIとしてPOSTできない
	protect_from_forgery with: :null_session

	def test_api
		id = params["userid"].to_i
		pass = params["userpass"]
		data = {"stamina" => 100 , "hoge" => "foo","id" => id+1,"userpass" => pass}
		render :json => data
	end

	def calc_bmi
		if params["height"] == nil or params["weight"] == nil
			render :json => {"result" => "error"}
		elsif params["height"].to_i - 100 < params["weight"].to_i
			render :json => {"result" => "success","message" => "too fat","h" => params["height"],"w" => params["weight"]}
		else
			render :json => {"result" => "success","message" => "not fat","h" => params["height"],"w" => params["weight"]}
		end
	end

	def get_list
		render :json => User.all
	end

	def get_user_hash
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

	def register_user
		response = Hash.new
		if params[:user] != nil or params[:pass] != nil 
			user = User.new
			colmuns = ['user','pass','userhash','created_at','updated_at']
			user.name = params[:user]
			user.pass = params[:pass]
			user.userhash = (0..15).map{('a'..'z').to_a[rand(26)]}.join
			user.created_at = Time.now.to_s.split("+")[0]
			user.updated_at = Time.now.to_s.split("+")[0]
			user.save 
			response = {:result => 'successed'}.merge({:userhash => user.userhash})
		else
			response = {:result => 'failed'} 
		end
		render :json => response
	end

end
