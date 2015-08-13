class Receiving < ActiveRecord::Base
  attr_accessor :name,:unit
  belongs_to :item,:inverse_of => :receiving
  belongs_to :user,:inverse_of => :receivings
  belongs_to :category,:inverse_of => :receivings


end
