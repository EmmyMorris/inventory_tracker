require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    @user = User.create(email: "emmymorris1102@gmail.com", password: "emmy")
    assign(:product, Product.new(
      name: "MyString",
      quantity: 1,
      user_id: @user.id
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[quantity]"
    end
  end
end
