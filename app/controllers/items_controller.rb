class ItemsController < ApplicationController
  before_action :all_categories, only: [:new,:create,:edit,:update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index

    @items = Item.paginate(:page => params[:page], :per_page => 4)
    @items = Item.order('category_id DESC').paginate(:page => params[:page], :per_page => 4) if params[:sort] =='up'
    @items = Item.order('category_id').paginate(:page => params[:page], :per_page => 4) if params[:sort] =='cid'

    @items = Item.order('name DESC ').paginate(:page => params[:page], :per_page => 4) if params[:sort] =='upn'
    @items = Item.order(params[:sort]).paginate(:page => params[:page], :per_page => 4) if params[:sort] =='name'
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:category_id, :name, :description, :cas_no, :reorder_level,:unit)
    end
  def all_categories
    @categories = Category.order(:name)
  end
end
