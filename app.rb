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

class Record < ActiveRecord::Base
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

	hh = { :username => 'Введите имя',
       :phone => 'Введите номер телефона',
       :datetime => 'Введите дату и время визита' }
       @error = hh.select {|key,_| params[key] == ""}.values.join(",")
       #для каждой пары ключ-значение
    #   hh.each do |key, value|
        #если параметр пуст
     #          if  params[key] == ''
                #переменной error присвоить значение value из хеша hh
                #(а value из хеша hh это сообщение об ошибке)
                #т.е. переменной error присвоить сообщение об ошибке
                if @error != ''
                    return erb :visit
                end



	

    @title = 'Thank you!'
	@message = "Дорогой #{@username}, вы записались #{@datetime} к парикмахеру #{@baber},цвет краски: #{@color}"

	#f = File.open 'users.txt', 'a'
	#f.write "User: #{@username}, Phone: #{@phone}, Date and time: #{@datetime} ,Baber:#{@baber}, Color:#{@color}"
	#f.close       		db = get_db


	erb :message
end


get '/showusers' do
        db = get_db

        @results = db.execute 'select * from Clients order by id desc'
 erb :showusers
end
