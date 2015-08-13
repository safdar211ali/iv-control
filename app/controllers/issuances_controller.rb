class IssuancesController < ApplicationController
  before_action :set_issuance, only: [:show, :edit, :update, :destroy]

  # GET /issuances
  # GET /issuances.json
  def index
    @issuances = Issuance.paginate(:page => params[:page], :per_page => 8)

    @issuances = Issuance.order('item_id DESC').paginate(:page => params[:page], :per_page => 3) if params[:sort] =='up'
    @issuances = Issuance.order('item_id').paginate(:page => params[:page], :per_page => 3) if params[:sort]=='name'

    @issuances = Issuance.order('created_at DESC').paginate(:page => params[:page], :per_page => 3) if params[:sort] =='upc'
    @issuances = Issuance.order('created_at').paginate(:page => params[:page], :per_page => 3) if params[:sort]=='ca'
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  # GET /issuances/1
  # GET /issuances/1.json
  def show
  end

  # GET /issuances/new
  def new
    id = params[:issuance][:id]
    @stock = Stock.find(id)
    @item = Item.find( @stock.item_id)
    sum_stock = Stock.total(@stock.item_id)
    @issuance = Issuance.new
    @issuance.name = @stock.item.name
    @issuance.item_id = @stock.item_id
    @issuance.qtypresent = sum_stock
    @issuance.qtysingle = @stock.qtyreceived
    @issuance.stock_id = id
    @issuance.unit = @stock.item.unit
    @issuance.expiry = @stock.expiry
    @issuance.category_id = @item.category_id
  end

  # GET /issuances/1/edit
  def edit
    item_id = @issuance.item_id
    @item = Item.find(item_id)
    @item_name = Item.find(item_id)
    # @receiving.name = @item_name.name
    @issuance.item_id = @item_name.id
    @issuance.unit = @item_name.unit
    @issuance.category_id = @item_name.category_id
  end

  # POST /issuances
  # POST /issuances.json
  def create
    @issuance = Issuance.new(issuance_params)
    respond_to do |format|
      if @issuance
        current_user.issuances << @issuance
        stk_id = params[:issuance][:stock_id]
        qtysb = params[:issuance][:qtysingleb]
        stock = Stock.find(stk_id)
        stock.update(:qtyreceived => qtysb)
        format.html { redirect_to issuances_path, notice: 'Issuance was successfully created.' }
        format.json { render :show, status: :created, location: @issuance }
      else
        format.html { render :new }
        format.json { render json: @issuance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issuances/1
  # PATCH/PUT /issuances/1.json
  def update
    respond_to do |format|
      if @issuance.update(issuance_params)
        format.html { redirect_to @issuance, notice: 'Issuance was successfully updated.' }
        format.json { render :show, status: :ok, location: @issuance }
      else
        format.html { render :edit }
        format.json { render json: @issuance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issuances/1
  # DELETE /issuances/1.json
  def destroy
    @issuance.destroy
    respond_to do |format|
      format.html { redirect_to issuances_url, notice: 'Issuance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def newissue
    @issuance = Issuance.new
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_issuance
    @issuance = Issuance.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issuance_params
    params.require(:issuance).permit(:expiry,:category_id, :stock_id, :item_id, :name, :qtysingle, :qtysingleb, :description, :qtyissued, :qtypresent, :qtybalance)
  end
end
