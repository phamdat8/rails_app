class PropertiesController < ApplicationController
    before_action :set_property
    def index
    end

    def new
        @property = Property.new
    end

    def create
        Property.create(property_params)
        render :index
    end

    def destroy
        @property.destroy
        render :index
    end

    private
    
    def set_property
        @property = Property.find(params[:id]) if params[:id]
        @properties = Property.all
    end

    def property_params
        params.require(:property).permit(:name)
    end
end
