class PurchaseDetailsController < ApplicationController
  before_action :set_purchase_detail, only: %i[ show edit update destroy ]

  # GET /purchase_details or /purchase_details.json
  def index
    @purchase_details = PurchaseDetail.all
    render json: @purchase_details, include: { product: { only: [:name, :is_imported, :tax] } }, except: %i[created_at updated_at product_id]
  end

  # GET /purchase_details/1 or /purchase_details/1.json
  def show
  end

  # GET /purchase_details/new
  def new
    @purchase_detail = PurchaseDetail.new
  end

  # GET /purchase_details/1/edit
  def edit
  end

  # POST /purchase_details or /purchase_details.json
  def create
    @purchase_detail = PurchaseDetail.new(purchase_detail_params)

    respond_to do |format|
      if @purchase_detail.save
        format.html { redirect_to purchase_detail_url(@purchase_detail), notice: "Purchase detail was successfully created." }
        format.json { render :show, status: :created, location: @purchase_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchase_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_details/1 or /purchase_details/1.json
  def update
    respond_to do |format|
      if @purchase_detail.update(purchase_detail_params)
        format.html { redirect_to purchase_detail_url(@purchase_detail), notice: "Purchase detail was successfully updated." }
        format.json { render :show, status: :ok, location: @purchase_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_details/1 or /purchase_details/1.json
  def destroy
    @purchase_detail.destroy

    respond_to do |format|
      format.html { redirect_to purchase_details_url, notice: "Purchase detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_detail
      @purchase_detail = PurchaseDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_detail_params
      params.require(:purchase_detail).permit(:count, :price, :purchase_id, :product_id)
    end
end
