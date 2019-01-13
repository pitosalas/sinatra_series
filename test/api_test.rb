ENV['APP_ENV'] = 'test'

require_relative '../app.rb'
require 'minitest/autorun'
require 'rack/test'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'The HelloWorld App' do
  it "says hello" do
    get '/'
    last_response.ok?
    last_response.body.must_equal 'Hello Sinatra!'
  end
end

describe "API" do
  before do
    User.delete_all
  end

  describe "GET on /api/users/:id" do
    before do
      User.create(
        name: "Paul",
        email: "paul@gmail.com",
        password: "foo",
        bio: "Student")
    end

    it "Should retiurn user by name" do
      get '/api/users/paul'
      last_response.ok?
      attributes = JSON.parse(last_response.body)
      attributes["name"].must_equal "paul"
    end
  end
end
