class ReceivingsController < ApplicationController
  before_action :all_stock, only: [:new, :create, :edit, :update]
  before_action :all_items, only: [:new, :create, :edit, :update, :newstock]
  before_action :set_receiving, only: [:show, :edit, :update, :destroy]


  # GET /receivings
  # GET /receivings.json
  def index
    @receivings = Receiving.paginate(:page => params[:page], :per_page => 4)

    @receivings = Receiving.order('category_id DESC').paginate(:page => params[:page], :per_page => 4) if params[:sort] =='up'
    @receivings = Receiving.order('category_id').paginate(:page => params[:page], :per_page => 4) if params[:sort] =='cid'

    @receivings = Receiving.order('item_id DESC ').paginate(:page => params[:page], :per_page => 4) if params[:sort] =='upn'
    @receivings = Receiving.order('item_id').paginate(:page => params[:page], :per_page => 4) if params[:sort] =='name'

    @receivings = Receiving.order('expiry DESC').paginate(:page => params[:page], :per_page => 4) if params[:sort] =='upe'
    @receivings = Receiving.order('expiry ASC').paginate(:page => params[:page], :per_page => 4) if params[:sort] =='exp'
  end

  # GET /receivings/1
  # GET /receivings/1.json
  def show
  end

  # GET /receivings/new
  def new
    item_id = params[:receiving][:item_id]
    sum_stock = Stock.total(item_id)
    @item_name = Item.find(item_id)
    @receiving = Receiving.new
    @receiving.name = @item_name.name
    @receiving.item_id = @item_name.id
    @receiving.qtypresent = sum_stock
    @receiving.unit = @item_name.unit
    @receiving.category_id = @item_name.category_id
  end

  # GET /receivings/1/edit
  def edit
    item_id = @receiving.item_id
    @item_name = Item.find(item_id)
    @receiving.name = @item_name.name
    @receiving.item_id = @item_name.id
    @receiving.unit = @item_name.unit
    @receiving.category_id = @item_name.category_id
  end

  # POST /receivings
  # POST /receivings.json
  def create
    @receiving = Receiving.new(receiving_params)
    respond_to do |format|
      if @receiving
        current_user.receivings << @receiving
        f = Stock.new(stock_params)
        @stk_found = Stock.where('expiry = ? ', f.expiry).find_by_item_id(f.item_id)
        if @stk_found
          @stk_found.update(:qtyreceived => f.qtyreceived+@stk_found.qtyreceived)
        else
          @stock = Stock.new(stock_params)
          @stock.save
        end
        format.html { redirect_to receivings_path, notice: 'Receiving was successfully created.' }
        format.json { render :show, status: :created, location: @receiving }
      else
        format.html { render :new }
        format.json { render json: @receiving.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receivings/1
  # PATCH/PUT /receivings/1.json
  def update
    respond_to do |format|
      if @receiving.update(receiving_params)
        format.html { redirect_to @receiving, notice: 'Receiving was successfully updated.' }
        format.json { render :show, status: :ok, location: @receiving }
      else
        format.html { render :edit }
        format.json { render json: @receiving.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receivings/1
  # DELETE /receivings/1.json
  def destroy
    @receiving.destroy
    respond_to do |format|
      format.html { redirect_to receivings_url, notice: 'Receiving was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def newstock
    @receiving = Receiving.new
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_receiving
    @receiving = Receiving.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def receiving_params
    params.require(:receiving).permit(:item_id,:category_id, :description, :qtypresent, :qtyreceived, :qtybalance, :expiry)
  end

  def stock_params
    params.require(:receiving).permit(:item_id, :qtyreceived, :expiry)
  end

  def all_items
    @items = Item.order(:name)
  end

  def all_stock
    unless params[:data_v].blank?
      @all_stock =Stock.find(params[:data_v])
      redirect_to new_receiving_path
    end
  end

end
