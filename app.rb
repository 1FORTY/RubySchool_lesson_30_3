#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base

end

class Barber < ActiveRecord::Base

end

get '/' do
  @barbers = Barber.all # Просто сохраняем список в переменную
  @barbers_2 = Barber.order 'created_at DESC' # Сохраняем и добавляем сортировку по created_at и делаем мы это в обратном порядке из-за DESC

  erb :index
end

get '/visit' do

  erb :visit
end

post '/visit' do

  c = Client.new params[:client]
  c.save

  erb "Спасибо, вы записаны."

end
