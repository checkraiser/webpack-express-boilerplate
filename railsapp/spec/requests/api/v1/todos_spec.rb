require 'spec_helper'

describe "Todos API" do
  before(:each) do
    @api_key = ApiKey.create!
    @access_token = @api_key.access_token
    @current_user = FactoryGirl.create(:user)
    login(@current_user)
  end
  it 'sends a list of todos' do
    FactoryGirl.create(:todo)

    get '/api/v1/todos', access_token: @access_token

    json = JSON.parse(response.body)
    puts json
    # test for the 200 status-code
    expect(response).to be_success

    # check to make sure the right amount of messages are returned
    expect(json.length).to eq(1)
  end

  it 'create new todo' do
    post '/api/v1/todos', :content => 'Hello World', :access_token => @access_token
    post '/api/v1/todos', :content => 'Hello World 2', :access_token => @access_token
    json = JSON.parse(response.body)
    puts json
    expect(response).to be_success
    expect(json.length == 2)
    expect(json[0]['content'] == 'Hello World')
  end
end
