module ApplicationHelper
  def current_page(path)
    "active" if current_page?(path)
  end

  def form_error(object)
    render :partial => 'common/formerror',:locals => {:object=>object}
  end
  def up_arrow
   image_tag('sort_asc.png')
  end
  def down_arrow
    image_tag('sort_desc.png')
  end
 def show
   image_tag('view.png')
 end
  def stock
    image_tag('stock.png')
  end
  def receiving
    image_tag('receiving.png')
  end
  def issued
    image_tag('issued.png')
  end
  def search
    image_tag('search.png')
  end
end
