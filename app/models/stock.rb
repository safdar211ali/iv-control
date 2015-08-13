class Stock < ActiveRecord::Base
  belongs_to :item, inverse_of: :stocks

    def self.total(item_id)
    Stock.where(:item_id => item_id).sum(:qtyreceived)
  end

  def present_stock
    " #{item.name}[#{expiry}][#{qtyreceived}-#{item.unit}]"
  end

def self.sumup_stock
  Stock.select("expiry,sum(qtyreceived) as total" ).where("expiry <= ?", Date.today).group(:expiry).order(:expiry)
end
  def self.expired
  Stock.select('item_id,expiry,sum(qtyreceived) AS tot').where('expiry <= ? AND qtyreceived >0', Date.today).group(:item_id,:expiry).order(:expiry)
  end





end
