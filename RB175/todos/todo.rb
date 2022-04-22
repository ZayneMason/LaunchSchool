require 'tilt/erubis'
require 'sinatra'
require 'sinatra/content_for'
require 'sinatra/reloader' if development?

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, :escape_html => true
end

before do
  session[:lists] ||= []
end
get '/' do
  redirect '/lists'
end

helpers do
  def list_complete?(list)
    list[:todos].size > 0 && list[:todos].all? { |todo| todo[:completed] }
  end

  def list_class(list)
   "complete" if list_complete?(list)
  end

  def sort_lists(lists, &block)
    incomplete_lists = {}
    complete_lists = {}

    lists.each_with_index do |list, index|
      if list_complete?(list)
        complete_lists[index] = list
      else
        incomplete_lists[index] = list
      end
    end

    incomplete_lists.each { |id, list| yield(list, id)}
    complete_lists.each { |id, list| yield(list, id)}
  end

  def sort_todos(todos, &block)
    complete_todos, incomplete_todos = todos.partition {|todo| todo[:completed] }
    
    incomplete_todos.each { |id, todo| yield(todo, id) }
    complete_todos.each { |id, todo| yield(todo, id) }
  end
end

def load_list(index)
  list = session[:lists][index.to_i] if index && session[:lists][index.to_i]
  return list if list

  session[:error] = "The specified list was not found."
  redirect "/lists"
end

not_found do
  status 404
  session[:error] = "That page cannot be located."
  redirect '/lists'
end

# Displays all lists
get '/lists' do
  @lists = session[:lists]
  erb :lists
end

# Renders new list form
get '/lists/new' do
  erb :new_list
end

# Creates new list
post '/lists' do
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list
  else
    session[:lists] << { name: list_name, todos: [] }
    session[:success] = 'The list has been created.'
    redirect '/lists'
  end
end

# Returns error message if list name is invalid, else nil
def error_for_list_name(list_name)
  if !(1..100).cover?(list_name.size)
    'Please make sure that the list name is between 1 and 100 characters.'
  elsif session[:lists].any? { |list| list[:name] == list_name }
    'Please make sure that the list name is unique.'
  end
end

get "/lists/:list_id" do
  @list_id = params[:list_id]
  @list = load_list(@list_id)
  erb :list
end

# Edit existing todo list
get "/lists/:list_id/edit" do
  @list_id = params[:list_id]
  @list = load_list(@list_id)
  erb :edit_list
end

# Update existing list
post "/lists/:list_id" do
  @list_id = params[:list_id]
  list_name = session[:lists][@list_id.to_i][:name].strip
  error = error_for_list_name(list_name)
  @list = load_list(@list_id)
  if error
    session[:error] = error
    erb :edit_list
  else
    @list[:name] = list_name
    session[:success] = 'The list has been updated.'
    redirect "/lists/#{params[:list_id]}"
  end
end

# Deletes a list
post "/lists/:list_id/destroy" do
  @list_id = params[:list_id]
  session[:lists].delete_at(@list_id.to_i)

  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    "/lists"
  else
    session[:success] = "The list has been deleted."
    redirect '/lists'
  end
end

# Returns error message if todo name is invalid, else nil
def error_for_todo_name(todo_name)
  if !(1..100).cover?(todo_name.size)
    'Please make sure that the todo name is between 1 and 100 characters.'
  end
end

post "/lists/:list_id/todos" do
  @list_id = params[:list_id]
  @list = load_list(@list_id)
  text = params[:todo].strip

  error = error_for_todo_name(text)
  if error
    session[:error] = error
    erb :list
  else
    @list[:todos] << {name: text, completed: false}
    session[:success] = "Todo added."
    redirect "/lists/#{@list_id}"
  end
end

# Deletes a todo item
post "/lists/:list_id/todos/:todo_id/destroy" do
  @list_id = params[:list_id]
  @list = load_list(@list_id)

  todo_id = params[:todo_id].to_i
  @list[:todos].delete_at(todo_id)

  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    status 204
  else
    session[:success] = "Todo item has been deleted."
    redirect "/lists/#{@list_id}"
  end
end

post "/lists/:list_id/todos/:todo_id" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)

  todo_id = params[:todo_id].to_i
  is_completed = params[:completed] == "true"
  @list[:todos][todo_id][:completed] = is_completed

  session[:success] = "The todo has been updated."
  redirect "/lists/#{@list_id}"
end

post "/lists/:list_id/complete_all" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
  @list[:todos].each { |todo| todo[:completed] = true }

  session[:success] = "All items have been marked complete."
  redirect "/lists/#{@list_id}"
end
