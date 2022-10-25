class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[ show edit update destroy ]

  # GET /purchases or /purchases.json
  def index
    @purchases = Purchase.all
    render json: @purchases, include: { purchase_details: { only: [:count, :price, :tax],include: { product: { only: [:name, :is_imported, :tax] } } } }, except: %i[created_at updated_at]
  end

  # GET /purchases/1 or /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases or /purchases.json
  def create
    @purchase = Purchase.create()
    @taxes = 0
    @total = 0
    params[:purchase_details].each do |details|
      @product = Product.find_by(name: details[:product_name], is_imported: details[:is_imported])
      @tax = ((@product.tax * details[:price] / 100)*20).round / 20.0
      @tax = (@tax * details[:count])
      @price = ((details[:price] * details[:count]) + @tax).round(2)
      @purchase_detail = PurchaseDetail.create(
        product: @product,
        purchase: @purchase,
        count: details[:count],
        price: @price
      )
      @taxes += @tax
      @total += @price
    end
    @purchase.update!(sales_tax: @taxes, total: (@total).round(2))
    if @purchase.save
      render json: @purchase.as_json(except: [:created_at, :updated_at])
    else
      format.json { render json: @purchase.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /purchases/1 or /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to purchase_url(@purchase), notice: "Purchase was successfully updated." }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1 or /purchases/1.json
  def destroy
    @purchases = Purchase.all
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    render json: @purchases.as_json(except: [:created_at, :updated_at])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_params
      params.require(:purchase).permit(:sales_tax, :total)
    end
end
