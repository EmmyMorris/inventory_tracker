class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @user = User.find(current_user.id)
    @products = @user.products.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @user = User.find(current_user.id)
    @product = @user.products.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @user = User.find(current_user.id)
    @product = @user.products.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    require "pry"; binding.pry
    @user = User.find(current_user.id)
    @product = @user.products.find(params[:id])
    @product.destroy
    redirect_to products_url, notice: "Product was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @user = User.find(current_user.id)
      @product = @user.products.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :quantity, :user_id)
    end
end
