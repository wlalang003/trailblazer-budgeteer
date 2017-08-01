require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :name => "MyString",
      :description => "MyText",
      :ttype => false
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input#transaction_name[name=?]", "transaction[name]"

      assert_select "textarea#transaction_description[name=?]", "transaction[description]"

      assert_select "input#transaction_type[name=?]", "transaction[type]"
    end
  end
end
