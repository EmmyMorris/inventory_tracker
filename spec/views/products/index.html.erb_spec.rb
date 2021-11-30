require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    @user = User.create(email: "emmymorris1102@gmail.com", password: "emmy")
    assign(:products, [
      Product.create!(
        name: "Name",
        quantity: 2,
        user_id: @user.id

      ),
      Product.create!(
        name: "Name",
        quantity: 2,
        user_id: @user.id
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
