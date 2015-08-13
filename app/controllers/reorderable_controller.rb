class ReorderableController < ApplicationController
  layout 'reports'
  def reorder_stock
    # exp_ids =  Stock.where('expiry <= ? AND qtyreceived >0', Date.today).uniq.pluck('item_id')
    # @items = Item.find(exp_ids)
    @items = Item.all
  end
end
