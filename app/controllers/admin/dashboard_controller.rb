class Admin::DashboardController < ApplicationController
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: ENV["HTTP_ADMIN_USER"],
                          password: ENV["HTTP_ADMIN_PASSWORD"]
  def show
    @product_count = Product.all.count
    @category_count = Category.all.count
  end
end
