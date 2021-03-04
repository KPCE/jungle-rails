class Admin::CategoriesController < ApplicationController
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: ENV["HTTP_ADMIN_USER"],
                              password: ENV["HTTP_ADMIN_PASSWORD"]
  
  def index
    @categories = Category.order(id: :desc).all
    @products = Product.group(:category_id).count
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(product_params)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:category).permit(
      :name
    )
  end


end
