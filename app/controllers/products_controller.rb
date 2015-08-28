class ProductsController < ApplicationController
	def index
		@products= Product.all
	end
 def new
    @product = Product.new
1.times{@product.images.build}
end

def create
    @product = Product.new(product_params)
 1.times{@product.images.build} if @product.images.blank?
 if @product.save
  redirect_to products_path
else
  render :new
  end
end

def show
	@product= Product.find(params[:id])
	 respond_to do |format|
      format.html
      format.pdf do
        render pdf: "nested_pdf"   # Excluding ".pdf" extension.
      end
    end
end
def edit
	@product= Product.find(params[:id])
end
def update
	@product= Product.find(params[:id])
	if @product.update(product_params)
		redirect products_path
	else
		render 'edit'
	end
end
def destroy
	@product= Product.find(params[:id])
	@product.destroy
	redirect_to products_path
end
private
def product_params
	params.require(:product).permit!
end

end
