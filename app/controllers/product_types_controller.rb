class ProductTypesController < ApplicationController
    def new
        @product_id = params[:id].to_i
        @product_properties = ProductProperty.where("product_id = #{@product_id}").joins(:property)
    end

    def create
        product_type = ProductType.create(product_id: params[:id], quantity: params[:quantity], image: params[:image])
        params[:properties].each do | property |
            PropertyValue.create(product_type_id: product_type.id, property_id: property[0], value: property[1])
        end
        redirect_to product_url(Product.find(params[:id]))
    end
end
