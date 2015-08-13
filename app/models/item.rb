class Item < ActiveRecord::Base
  UNIT = ['Kg', 'Liter', 'mL', 'pkt', 'Each', 'Cylinder', 'Pair', 'Box']
  belongs_to :category, :inverse_of => :items
  has_many :stocks, :inverse_of => :item
  has_one :receiving, :inverse_of => :item
  has_many :issuances, inverse_of: :item

  def issued_sum
    Issuance.where('item_id = ? ',self.id).sum(:qtyissued)
  end
  def received_sum
    Receiving.where('item_id = ? ',self.id).sum(:qtyreceived)
  end
  def issued_sum_by_date(d1,d2)
    Issuance.where('created_at BETWEEN ? AND ? AND item_id = ? ',d1,d2,self.id).sum(:qtyissued)
  end
  def received_sum_by_date(d1,d2)
    Receiving.where('created_at BETWEEN ? AND ? AND item_id = ? ',d1,d2,self.id).sum(:qtyreceived)
  end
  def sum_stock
    stocks.sum(:qtyreceived)
  end
  def exp_sum_stock
    stocks.where('expiry <= ? AND qtyreceived >0', Date.today).sum(:qtyreceived)
  end
  # def reorderable_sum
  #   stocks.where('qtyreceived <= ? ', self.reorder_level).sum(:qtyreceived)
  # end

  def reorderable
    Stock.select('item_id,expiry,qtyreceived').where('qtyreceived <= ? ',self.reorder_level).group(:item_id)
  end
  def issued
    Issuance.select('user_id,item_id,created_at,sum(qtyissued) AS tot').where('item_id = ? ',self.id).group(:user_id,:item_id,:created_at)
  end
  def received
    Receiving.select('user_id,item_id,created_at,sum(qtyreceived) AS tot').where('item_id = ? ',self.id).group(:user_id,:item_id,:created_at)
  end
  def received_by_cat
    Receiving.select('user_id,item_id,created_at,sum(qtyreceived) AS tot').where('item_id = ? ',self.id).group(:user_id,:item_id,:created_at)
  end
  def issued_by_date(d1,d2)
    Issuance.select('user_id,item_id,created_at,sum(qtyissued) AS tot').where('created_at BETWEEN ? AND ? AND item_id = ? ',d1,d2,self.id).group(:user_id,:item_id,:created_at)
  end
  def received_by_date(d1,d2)
    Receiving.select('user_id,item_id,created_at,sum(qtyreceived) AS tot').where('created_at BETWEEN ? AND ? AND item_id = ? ',d1,d2,self.id).group(:user_id,:item_id,:created_at)
  end

end
