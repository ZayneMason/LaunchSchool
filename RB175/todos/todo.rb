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
    if list[:todos].size > 0
      list[:todos].all? { |todo| todo[:completed] }
    else
      false
    end
  end

  def list_class(list)
   "complete" if list_complete?(list)
  end

  def sort_lists(lists, &block)
    complete_lists, incomplete_lists = lists.partition { |list| list_complete?(list) }

    incomplete_lists.each(&block)
    complete_lists.each(&block)
  end

  def sort_todos(todos, &block)
    complete_todos, incomplete_todos = todos.partition {|todo| todo[:completed] }
    
    incomplete_todos.each { |todo| yield(todo) }
    complete_todos.each { |todo| yield(todo) }
  end
end

# Returns error message if todo name is invalid, else nil
def error_for_todo_name(todo_name)
  if !(1..100).cover?(todo_name.size)
    'Please make sure that the todo name is between 1 and 100 characters.'
  end
end

def next_element_id(elements)
  max = elements.map {|element| element[:id] }.max || 0
  max + 1
end

def load_list(id)
  list = session[:lists].find{ |list| list[:id] == id}
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
    session[:lists] << { id: next_element_id(session[:lists]) || 0,  name: list_name, todos: Array.new }
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
  id = params[:list_id].to_i
  @list = load_list(id)
  @list_name = @list[:name]
  @list_id = @list[:id]
  @todos = @list[:todos]
  erb :list
end

# Edit existing todo list
get "/lists/:list_id/edit" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
  erb :edit_list
end

# Update existing list
post "/lists/:list_id" do
  @list_id = params[:list_id].to_i
  list_name = session[:lists][@list_id][:name].strip
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
  list_id = params[:list_id].to_i
  session[:lists].reject! {|list| list[:id] == list_id}

  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    "/lists"
  else
    session[:success] = "The list has been deleted."
    redirect '/lists'
  end
end

# Adds a new todo to a list
post "/lists/:list_id/todos" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
  text = params[:todo].strip

  error = error_for_todo_name(text)
  if error
    session[:error] = error
    erb :list
  else
    @list[:todos] << {id: next_element_id(@list[:todos]) || 0, name: text, completed: false}
    session[:success] = "Todo added."
    redirect "/lists/#{@list_id}"
  end
end

# Deletes a todo item
post "/lists/:list_id/todos/:todo_id/destroy" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)

  todo_id = params[:todo_id].to_i
  @list[:todos].delete_if {|todo| todo[:id] == todo_id}

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

  todo_id = params[:todo_id]
  is_completed = params[:completed] == "true"
  @list[:todos].select { |todo| todo[:id] == todo_id.to_i }[0][:completed] = is_completed

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
