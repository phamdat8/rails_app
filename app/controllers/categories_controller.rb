class CategoriesController < ApplicationController
    before_action :set_category
    def index
    end

    def new
        @category = Category.new
    end

    def edit
    end

    def show
    end

    def update
        @category.update(category_params)
        render :index
    end

    def create
        Category.create(category_params)
        render :index
    end

    def destroy
        @category.destroy
        render :index
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end

    def set_category
        @category = Category.find(params[:id]) if params[:id]
        @categories = Category.all
    end
end
