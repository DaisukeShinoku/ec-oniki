class SearchProductsForm
  attr_accessor :products
  attr_reader :category_id, :area_id

  def initialize(params)
    @category_id = params[:category_id]
    @area_id = params[:area_id]
    @products = Product.all
  end

  def result
    products = search_by_all
    products
  end

  private


  def search_by_all

    if !category_id.present? && !area_id.present?
      return products
    end

    area_search = []
    category_search = []

    if area_id.present?
      area = Area.find(area_id)
      area_search = area.products
    end

    if category_id.present?
      category = Category.find(category_id)
      category_search = category.products
    end

    products = area_search.concat(category_search)
  end

end