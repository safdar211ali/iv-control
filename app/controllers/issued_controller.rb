class IssuedController < ApplicationController
  layout 'reports'

  def rep_select
    @issu_dates = Issuance.uniq.select(:created_at).order(:created_at)
  end

  def rep_issued
    if !params[:q].blank?
      val = params[:q][:id]
      begin
        @item = Item.find_by_id(val)
      rescue
        flash[:notice]='Record Not Found!'
      end
    elsif !params[:a].blank?
      @d1 = params[:a][:s_d]
      @d2 = params[:a][:e_d]
      begin
        issuance_itm_ids = Issuance.uniq.select('item_id').where('created_at BETWEEN ? AND ? ', @d1, @d2)
        @items_by_date = Item.where(:id => issuance_itm_ids)
      rescue
        flash[:notice]='Record Not Found!'
      end
    elsif !params[:u].blank?
      user = params[:u][:id]
      begin
        issuance_itm_ids = Issuance.uniq.select('item_id').where('user_id = ? ', user)
        @items = Item.where(:id => issuance_itm_ids)
      rescue
        flash[:notice]='Record Not Found!'
      end

    elsif !params[:c].blank?
      cat = params[:c][:id]
      @cat_name = Category.find(cat)
      begin
        issuance_itm_ids = Issuance.uniq.select('item_id').where('category_id = ? ', cat)
        @items_by_cat = Item.where(:id => issuance_itm_ids)
      rescue
        flash[:notice]='Record Not Found!'
      end
    end
  end

end
