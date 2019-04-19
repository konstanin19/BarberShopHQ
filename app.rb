require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'IRB'
set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 3}
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
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
	@c = Client.new
	erb :visit
end

post '/visit' do
	@c = Client.new params[:client]
	if @c.save
	erb "<h3>Спасибо!
	         Дорогой <%= @c.name %>, вы записались <%= @c.datestamp %> к парикмахеру <%= @c.barber %>,цвет краски: <%= @c.color %></h3>"
	else
	@error = @c.errors.full_messages.first
	erb :visit
	end	
end

get '/showusers' do
  
 erb :showusers
end
