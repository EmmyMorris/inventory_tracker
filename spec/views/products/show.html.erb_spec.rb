require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @user = User.create(email: "emmymorris1102@gmail.com", password: "emmy")
    @product = assign(:product, Product.create!(
      name: "Name",
      quantity: 2,
      user_id: @user.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
