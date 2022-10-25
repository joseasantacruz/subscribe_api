class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
    render json: @products.as_json(except: [:created_at, :updated_at])
  end

  # GET /products/1 or /products/1.json
  def show
    render json: set_product.as_json(except: [:id, :created_at, :updated_at])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.create(
      name: params[:name],
      is_imported: params[:is_imported],
      tax: params[:tax]
    )
    if @product.save
      render json: @product.as_json(except: [:created_at, :updated_at])
    else
      format.json { render json: @product.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @products = Product.all
    @product = Product.find(params[:id])
    @product.destroy
    render json: @products.as_json(except: [:created_at, :updated_at])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :is_imported, :tax)
    end
end
