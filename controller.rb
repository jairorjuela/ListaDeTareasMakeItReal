require "sinatra"
require "make_todo"
require "httparty"

get '/' do
	@tareas = Tarea.all
	erb :index
end

post '/' do
Tarea.create(params[:verbo])
redirect '/'
end

get '/completar/:id' do
	id = params[:id]
	Tarea.update(id)
	redirect '/'
end

get '/eliminar/:id' do
	id = params[:id]
	Tarea.destroy(id)
	redirect '/'
end
