require 'spec_helper'

describe "tweets/index" do 
#   before(:each) do
#   assign(:tweets, [
#     stub_model(Tweet,
#       :status => "Title"
#     ),
#     stub_model(TodoList,
#       :status => "Title"
#       )
#   ])
#   end

  it "renders a list of tweets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "ul.todo-lists li div", :text => "Title".to_s, :count => 2
  end
end