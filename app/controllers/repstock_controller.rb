class RepstockController < ApplicationController
  layout 'reports'
  def rep_select

  end
  def rep_stock
    if !params[:all_stock].blank?
      @itemlists = Item.all
    elsif !params[:zero_stock].blank?
      stock_itm_ids = Stock.uniq.select('item_id').where('qtyreceived  > 0 ')
      @items = Item.where.not(:id => stock_itm_ids)
    elsif !params[:q].blank?
      begin
      @val = params[:q][:id]
      @itemlist = Item.find(@val)
      rescue
        flash[:notice]='Record Not Found!'
      end
    elsif !params[:expired].blank?
      exp_ids = Stock.where('expiry <= ? AND qtyreceived >0', Date.today).uniq.pluck('item_id')
      @expired_items = Item.find(exp_ids)
    end
  end
end
