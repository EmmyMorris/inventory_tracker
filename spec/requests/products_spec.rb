 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/products", type: :request do
  before(:each) do
    @user = User.create(email: 'user@test.com', password: 'test_password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  # Product. As you add validations to Product, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {{
    name: "apples",
    quantity: 10,
    user_id: @user.id
  }}

  let(:invalid_attributes) {{
    name: "",
    quantity: "hi",
    user_id: 0
  }}

  describe "GET /index" do
    it "renders a successful response" do
      Product.create! valid_attributes
      get products_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      product = Product.create! valid_attributes
      get product_url(product)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_product_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      product = Product.create! valid_attributes
      get edit_product_url(product)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Product" do
        expect {
          post products_url, params: { product: valid_attributes }
        }.to change(Product, :count).by(1)
      end

      it "redirects to the created product" do
        post products_url, params: { product: valid_attributes }
        expect(response).to redirect_to(product_url(Product.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Product" do
        expect {
          post products_url, params: { product: invalid_attributes }
        }.to change(Product, :count).by(0)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {{
          name: "oranges",
          quantity: 15,
          user_id: @user.id
        }}

      it "updates the requested product" do
        product = Product.create! valid_attributes
        patch product_url(product), params: { product: new_attributes }
        product.reload
        expect(assigns(:product).attributes['name']).to match(new_attributes[:name])
      end

      it "updates the requested product and sends email" do
        @product = @user.products.create(name: "peaches", quantity: 10)
        visit "/products/#{@product.id}/edit"
        fill_in "Name", with: 'peaches'
        fill_in "Quantity", with: 0
        click_on "Update Product"
        expect(page).to have_content("Product was successfully updated. Product is low, an email has been sent!")
      end

      it "redirects to the product" do
        product = Product.create! valid_attributes
        patch product_url(product), params: { product: new_attributes }
        product.reload
        expect(response).to redirect_to(product_url(product))
      end

      it "does not update the product" do
        @product = @user.products.create(name: "peaches", quantity: 10)
        visit "/products/#{@product.id}/edit"
        fill_in "Name", with: ''
        fill_in "Quantity", with: 5
        click_on "Update Product"
        expect {
          post users_url, params: { user: invalid_attributes }
        }.to change(User, :count).by(0)

        expect(page).to have_content("Name can't be blank")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested product" do
      product = Product.create! valid_attributes
      expect {
        delete product_url(product)
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      product = Product.create! valid_attributes
      delete product_url(product)
      expect(response).to redirect_to(products_url)
    end
  end
end
