require 'spec_helper'

describe "Todos API" do
  before(:each) do
    @current_user = FactoryGirl.create(:user)
    login(@current_user)
  end
  it 'sends a list of todos' do
    FactoryGirl.create(:todo)

    get '/api/v1/todos'

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    # check to make sure the right amount of messages are returned
    expect(json.length).to eq(1)
  end
end
