require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'IRB'
set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
@barbers = Barber.all
	end

get '/' do
	erb :index		
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phone     = params[:phone]
	@datetime = params[:datetime]
	@baber = params[:baber]
	@color = params[:color]


	

    @title = 'Thank you!'
	@message = "Дорогой #{@username}, вы записались #{@datetime} к парикмахеру #{@baber},цвет краски: #{@color}"

	#f = File.open 'users.txt', 'a'
	#f.write "User: #{@username}, Phone: #{@phone}, Date and time: #{@datetime} ,Baber:#{@baber}, Color:#{@color}"
	#f.close       		db = get_db


	erb :message
end
