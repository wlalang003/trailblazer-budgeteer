require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      :name => "MyString",
      :description => "MyText",
      :ttype => false
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input#transaction_name[name=?]", "transaction[name]"

      assert_select "textarea#transaction_description[name=?]", "transaction[description]"

      assert_select "input#transaction_type[name=?]", "transaction[type]"
    end
  end
end
