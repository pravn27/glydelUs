# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
issues=[
	{  
		"code": "P0565",
		"description": "Cruise Control On Signal Malfunction ",
		"level": "1",
		"service_action": "Regular Service",
		"date": "10/14/2016",
		"vehicle_number": "ABC12"
	},

	{
		"code": "P0566",
		"description": "Cruise Control Off Signal Malfunction  ",
		"level": "1",
		"service_action": "Regular Service",
		"date": "10/15/2016",
		"vehicle_number": "ABC24"
	},

	{
		"code": "P0567",
		"description": "Cruise Control Resume Signal Malfunction ",
		"level": "1",
		"service_action": "Regular Service",
		"date": "10/16/2016",
		"vehicle_number": "ABC12"
	},	

	{
		"code": "P0300",
		"description": "Misfire at Startup",
		"level": "0",
		"service_action": "Engine Tuning",
		"date": "10/17/2016",
		"vehicle_number": "ABC24"
	},	

	{
		"code": "P0316",
		"description": "Misfire Cylinder Random ",
		"level": "0",
		"service_action": "Engine Tuning",
		"date": "10/18/2016",
		"vehicle_number": "ABC12"
	},	

	{
		"code": "P0301",
		"description": "Misfire Cylinder #1",
		"level": "0",
		"service_action": "Engine Tuning",
		"date": "10/19/2016",
		"vehicle_number": "ABC24"
	},	

	{
		"code": "P0302",
		"description": "Misfire Cylinder #2",
		"level": "0",
		"service_action": "Engine Tuning",
		"date": "10/20/2016",
		"vehicle_number": "ABC12"
	},	

	{
		"code": "P0303",
		"description": "Misfire Cylinder #3",
		"level": "0",
		"service_action": "Engine Tuning",
		"date": "10/21/2016",
		"vehicle_number": "ABC24"
	},	

	{
		"code": "P0304",
		"description": "Misfire Cylinder #4",
		"level": "0",
		"service_action": "Engine Tuning",
		"date": "10/22/2016",
		"vehicle_number": "ABC12"
	},	

	{
		"code": "P0305",
		"description": "Misfire Cylinder #5",
		"level": "0",
		"service_action": "Engine Tuning",
		"date": "10/23/2016",
		"vehicle_number": "ABC24"
	},	

	{
		"code": "P0306",
		"description": "Misfire Cylinder #6",
		"level": "0",
		"service_action": "Engine Tuning",
		"date": "10/24/2016",
		"vehicle_number": "ABC12"
	},	

	{
		"code": "P242F",
		"description": "Diesel Particulate Filter Restriction",
		"level": "2",
		"service_action": "Fuel Filter Service",
		"date": "10/25/2016",
		"vehicle_number": "ABC24"
	},	

	{
		"code": "C0611",
		"description": "VIN Information Error",
		"level": "2",
		"service_action": "Regular Service",
		"date": "10/26/2016",
		"vehicle_number": "ABC12"
	}	
]

issues.each do |issue|
    Issue.create(:issue_code=>issue[:code], :issue_description=>issue[:description], :issue_level=>issue[:level], :service_action=>issue[:service_action], :issue_date=>issue[:date], :vehicle_number=>issue[:vehicle_number])
end
