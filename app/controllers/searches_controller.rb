class SearchesController < ApplicationController
  before_action :load_category, only: [:new]

  def index
    @products = Product.search(params[:search])
  end

  def show
    @search = Search.find_by id: params[:id]
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.create! search_params
    redirect_to @search
  end

  private

  def search_params
    params.require(:search).permit :keywords, :min_price, :max_price, :category_id,
      :min_rating
  end

  def load_category
    @category = Category.select(:name, :id)
      .map{|category| [category.name, category.id]}
  end
end
