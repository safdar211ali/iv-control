class Category < ActiveRecord::Base
  has_many :items,:inverse_of => :category
  has_many :receivings,:inverse_of => :category
  has_many :issuances,:inverse_of =>  :category
end
