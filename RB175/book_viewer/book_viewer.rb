require 'tilt/erubis'
require "sinatra"
require "sinatra/reloader"

get "/" do
  @title = "Table of Contents"
  @chapters = File.readlines("data/toc.txt")
  erb :home
end

get "/chapters/1" do
  @title = "Chapter 1"
  @chapters = File.readlines("data/toc.txt")
  @chapter = File.read("data/chp1.txt")

  erb :chapter
end
