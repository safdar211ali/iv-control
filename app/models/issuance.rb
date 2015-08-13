class Issuance < ActiveRecord::Base
  attr_accessor :stock_id,:unit
  belongs_to :item,:inverse_of => :issuances
   belongs_to :user,:inverse_of => :issuances
  belongs_to :category,:inverse_of => :issuances

  def self.sumup_issued
    Issuance.select("sum(qtyissued)")
  end

end
