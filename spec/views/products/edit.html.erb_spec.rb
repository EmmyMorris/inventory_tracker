require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @user = User.create(email: "emmymorris1102@gmail.com", password: "emmy")
    @product = assign(:product, Product.create!(
      name: "MyString",
      quantity: 1,
      user_id: @user.id
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[quantity]"
    end
  end
end
