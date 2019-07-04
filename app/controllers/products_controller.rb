class ProductsController < ApplicationController
    def index 

    end 

    def new 
        @product = Product.new

    end 

    def show 
        @product = Product.find(params[:id])
    end 

    def create 
        @product = Product.new(product_params)

            if @product.valid?
                @product.save
                session[:product_id] = @product.id 
                redirect_to product_path(@product)
            else 
            render :new 

            end 
    
        #@product = current_user.created_products.build(product_params)
end 

    private 

    def product_params
        params.require(:product).permit(:name, :cateogory, :description, :building, :floor_num, :in_stock, :date_added )
    end 
end
