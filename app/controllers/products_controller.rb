class ProductsController < ApplicationController
  before_action :load_category, :logged_in_user,
    :verify_admin!, except: [:show]
  before_action :load_product, except: [:new, :create]
  before_action :load_product_image, only: [:show, :edit]

  def index
  end

  def show
    store_location
    @product = Product.includes(:comments).find_by id: params[:id]
    @comment = @product.comments.new
    @product_images = @product.product_images
    @rating = @product.ratings.find_or_initialize_by user_id: current_user.id
    @comments = @product.comments.paginate(page: params[:page], per_page:
      Settings.paginate.per_page).order created_at: :desc
  end

  def new
    @product = Product.new
    product_image = @product.product_images.build
  end

  def edit
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t ".product_success"
      redirect_to @product
    else
      render :new
    end
  end

  def update
    if @product.update_attributes product_params
      flash[:info] = t ".success"
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:info] = t ".success"
    else
      flash[:danger] = t ".delete_fail"
    end
    redirect_to root_url
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity,
      :category_id, product_images_attributes: [:id, :product_id, :image, :_destroy])
  end

  def load_category
    @category = Category.all.map{|category| [category.name, category.id]}
  end

  def load_product
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:warning] = t "none"
      redirect_to root_url
    end
  end

  def load_product_image
    @product_images = @product.product_images
  end
end
