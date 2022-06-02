ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "rack/test"
require "fileutils"

require_relative "cms"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def setup
    FileUtils.mkdir_p(data_path) 
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def app
    Sinatra::Application
  end

  def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
  end

  def session
    last_request.env["rack.session"]
  end

  def admin_session
    { "rack.session" => { username: "admin"} }
  end

  def test_index
    create_document "about.txt"
    create_document "changes.txt"

    get "/", {}, admin_session

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.txt"
    assert_includes last_response.body, "changes.txt"
  end

  def test_file_viewing
    create_document "about.txt", "about"
    get "/about.txt", {}, admin_session

    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "about"
  end

  def test_non_existent_file
    get "/notafile.ext", {}, admin_session

    assert_equal 302, last_response.status
    assert_equal "notafile.ext does not exist.", session[:message]
  end

  def test_markdown
    create_document "markdown.md", "this is markdown"

    get "/markdown.md", {}, admin_session

    assert_equal 200, last_response.status
    assert_equal last_response["Content-Type"], "text/html;charset=utf-8"
    assert_includes last_response.body, "this is markdown"
  end

  def test_editing_document
    create_document "changes.txt"
    get "/changes.txt/edit", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_updating_document
    create_document "changes.txt"
    post "/changes.txt", { content: "new content" }, admin_session

    assert_equal 302, last_response.status
    assert_equal "changes.txt has been updated.", session[:message]

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end

  def test_view_new_document_form
    get "/new", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_create_new_document
    post "/create", { filename: "test.txt" }, admin_session
    assert_equal 302, last_response.status

    get last_response["Location"]
    assert_includes last_response.body, "test.txt has been created"

    get "/", {}, admin_session
    assert_includes last_response.body, "test.txt"
  end

  def test_create_new_document_without_filename
    post "/create", { filename: "" }, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, "Please name the file."
  end

  def test_view_new_document_form
    get "/new", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_create_new_document
    post "/create", { filename: "test.txt" }, admin_session
    assert_equal 302, last_response.status

    get last_response["Location"]
    assert_includes last_response.body, "test.txt has been created"

    get "/", {}, admin_session
    assert_includes last_response.body, "test.txt"
  end

  def test_create_new_document_without_filename
    post "/create", { filename: "" }, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, "Please name the file."
  end

  def test_deleting_document
    create_document "test.txt"

    post "/test.txt/delete", {}, admin_session
    assert_equal 302, last_response.status
    assert_equal "test.txt has been deleted.", session[:message]

    get "/", {}, admin_session
    refute_includes last_response.body, %q(href="/test.txt")
  end

  def test_signin_form
    get "/users/signin", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_signin
    post "/users/signin", username: "admin", password: "secret"
    assert_equal 302, last_response.status
    assert_equal "Welcome!", session[:message]
    assert_equal "admin", session[:username]

    get last_response["Location"]
    assert_includes last_response.body, "Signed in as admin"
  end

  def test_signin_with_bad_credentials
    post "/users/signin", username: "guest", password: "shhhh"
    assert_equal 422, last_response.status
    assert_nil session[:username]
    assert_includes last_response.body, "Invalid"
  end

  def test_signout
    get "/", {}, admin_session
    assert_includes last_response.body, "Signed in as admin"

    post "/users/signout"
    assert_equal "You have been signed out.", session[:message]

    get last_response["Location"]
    assert_nil session[:username]
    assert_includes last_response.body, "Sign In"
  end

  def test_file_viewing_nouser
    create_document "about.txt", "about"
    get "/about.txt", {}

    get last_response["Location"]
    assert_includes last_response.body, "You must be signed in to do that."
  end

  def test_non_existent_file_nouser
    get "/notafile.ext", {}

    get last_response["Location"]
    assert_includes last_response.body, "You must be signed in to do that."
  end

  def test_markdown_nouser
    create_document "markdown.md", "this is markdown"

    get "/markdown.md", {}

    get last_response["Location"]
    assert_includes last_response.body, "You must be signed in to do that."
  end

  def test_editing_document_nouser
    create_document "changes.txt"
    get "/changes.txt/edit", {}

    get last_response["Location"]
    assert_includes last_response.body, "You must be signed in to do that."
  end

  def test_updating_document_nouser
    create_document "changes.txt"
    post "/changes.txt", { content: "new content" }

    get last_response["Location"]
    assert_includes last_response.body, "You must be signed in to do that."
  end

  def test_view_new_document_form_nouser
    get "/new", {}

    get last_response["Location"]
    assert_includes last_response.body, "You must be signed in to do that."
  end

  def test_create_new_document_nouser
    post "/create", { filename: "test.txt" }
    assert_equal 302, last_response.status

    get last_response["Location"]
    assert_includes last_response.body, "You must be signed in to do that."
  end

  def test_create_account
    post "/users/create", { username: "test_user", password: "test_password" }

    assert_equal 302, last_response.status
    assert_includes session[:message], "An account"
    
    post "/users/signin", { username: "test_user", password: "test_password" }

    assert_equal 302, last_response.status
    assert_equal "Welcome!", session[:message]
    assert_equal "test_user", session[:username]
  end

  def test_copy_file
    create_document "changes.txt"
    post "/changes.txt", { content: "new content" }, admin_session

    get "/changes.txt/copy"
    assert_equal 200, last_response.status

    post "/create", {filename: "changes_copy.txt"}
    
    assert_equal 302, last_response.status
    
    get last_response["Location"]

    assert_includes last_response.body, "changes_copy.txt"

    get "/changes_copy.txt"

    assert_includes last_response.body, "new content"
  end
end
