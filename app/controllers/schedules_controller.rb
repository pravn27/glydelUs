class SchedulesController < ApplicationController

	def index
		
	end

	def list
		@vehicles= []
		current_user.companies.each do |c|
			@vehicles += c.vehicles.where(:vehicle_number=>/#{params[:search]}/i)
		end
		render :json=> { data: @vehicles}
	end

	def all
		@vehicles= @schedules=[]
		current_user.companies.each do |c|
			@vehicles += c.vehicles
		end
		if params[:date].present?
			@vehicles.each do |v|
				@schedules += v.schedules.where(:scheduled_date => params[:date], :is_active => "true", :status => "pending")
			end
		else
			@vehicles.each do |v|
				@schedules += v.schedules.where(:is_active => "true", :status => "pending")
			end
		end
		render :json=> { data: @schedules}

	end

	def edit
		@schedule = Schedule.find(params[:id])
		render :json=> { data: @schedule}
	end

	def create
		vehicle = Vehicle.find_by(:vehicle_number=>params[:vehicle_number])
		if vehicle.present?
			schedule = vehicle.schedules.create(schedule_params)
			render :json=> { message:"Schedule created Succesfully", path: schedules_path}
		else
			render :json=> { message:"Unable to save. Please try againy", path: schedules_path}
		end
	end

	def update
		schedule = Schedule.find(params[:id])
		if schedule.present?
			schedule = schedule.update(schedule_params)
			render :json=> { message:"Schedule updated Succesfully", path: schedules_path}
		else
			render :json=> { message:"Unable to update. Please try again", path: schedules_path}
		end
	end

	def issues
		schedule = Schedule.find(params[:id])
		if schedule.present?
			vehicle = schedule.vehicle
			render :json=> { message:"Issues", path: issues_path, data: vehicle}
		else
			render :json=> { message:"Unable to fetch. Please try again", path: schedules_path}
		end
	end

	def complete
		schedule = Schedule.find(params[:id])
		if schedule.present?
			schedule = schedule.update(:status => "completed")
			render :json=> { message:"Schedule updated Succesfully", path: schedules_path}
		else
			render :json=> { message:"Unable to update. Please try again", path: schedules_path}
		end
	end

	def events
		@vehicles= @schedules=[]
		current_user.companies.each do |c|
			@vehicles += c.vehicles
		end
		@vehicles.each do |v|
			@schedules += v.schedules.where(:is_active => "true", :status => "pending")
		end
		@events = @schedules.map{|s|s.scheduled_date.to_s}
		render :json=> { data: @events}
	end

	def destroy
		schedule = Schedule.find(params[:id])
		if schedule.present?
			schedule = schedule.update(:is_active => false)
			render :json=> { message:"Schedule removed Succesfully", path: schedules_path}
		else
			render :json=> { message:"Unable to delete. Please try again", path: schedules_path}
		end
	end

	def calendar
		
	end
	
	private

	def schedule_params
		params.permit(:vehicle_number, :vehicle_type, :scheduling_details, :scheduled_date)
	end

end
