require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "redcarpet"

configure do
  enable :sessions
  set :session_secret, "1"
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content(path)
  content = File.read(path)
  case File.extname(path)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  when ".md"
    erb render_markdown(content)
  end
end

get "/users/signin" do
 erb :signin, layout: :layout
end

post "/users/signin" do
  if params[:username] == "admin" && params[:password] == "secret"
    session[:username] = params[:username]
    session[:message] = "Welcome!"
    redirect "/"
  else
    session[:message] = "Invalid username or password."
    status 422
    erb :signin, layout: :layout
  end
end

post "/users/signout" do
  session.delete(:username)
  session[:message] = "You have been signed out."
  redirect "/"
end

get "/" do
  pattern = File.join(data_path, "*")
  @files = Dir.glob(pattern).map do |path|
    File.basename(path)
  end

  erb :index, layout: :layout
end

get "/new" do
  erb :new_doc
end

post "/create" do
  filename = params[:filename]
  
  if filename.size == 0
    session[:message] = "Please name the file."
    status 422
    erb :new_doc
  else
    new_doc = File.join(data_path, filename)

    if File.extname(new_doc).empty?
      session[:message] = "Please include an extension in the file name."
      redirect "/new"
    end
    
    File.write(new_doc, "")
    session[:message] = "#{params[:filename]} has been created."

    redirect "/"
  end
end

get "/:filename" do
  file_to_view = File.join(data_path, params[:filename])
  if !File.exist?(file_to_view)
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end

  load_file_content(file_to_view)
end

get "/:filename/edit" do
  file_to_edit = File.join(data_path, params[:filename])

  @filename = params[:filename]
  @content = File.read(file_to_edit)

  erb :edit, layout: :layout
end

post "/:filename" do
  file_to_edit = File.join(data_path, params[:filename])

  File.write(file_to_edit, params[:content])

  session[:message] = "#{params[:filename]} has been updated."
  redirect "/"
end

post "/:filename/delete" do
  file_to_delete = File.join(data_path, params[:filename])
  if !File.exist?(file_to_delete)
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end

  File.delete(file_to_delete)
  session[:message] = "#{params[:filename]} has been deleted."

  redirect "/"
end
