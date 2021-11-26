class ProductsController < ApplicationController
  before_action :set_product

  # GET /products or /products.json
  def index
    
  end

  # GET /products/1 or /products/1.json
  def show
  end

  def fancy_show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        update_product_property(params[:product][:properties], @product.id)
        format.html { redirect_to @product, notice: "Product was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id]) if params[:id]
      @products = Product.search(params[:search]).paginate(:page => params[:page], :per_page => 2)
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:sku, :title, :category_id)
    end

    def update_product_property properties, id
      properties.each do |property|
        ProductProperty.create(product_id: id, property_id: property[0].to_i) if property[1] == "1"
      end
    end
end
