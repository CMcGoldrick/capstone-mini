class ProductsController < ApplicationController
  def index
    @products = Product.all

    search_term = params[:search]
    if search_term
      @products = @products.where("name iLike ?",
                                "%#{search_term}%")
    end

    sort_attribute = params[:sort]
    if sort_attribute
      @products = @products.order(sort_attribute => :asc)
    end

    render 'index.json.jbuilder'
  end

  def create
    @product = Product.new(
                          name: params[:name],
                          description: params[:description],
                          price: params[:price],
                          image_url: params[:image_url]
                          )
    if @product.save
    render 'show.json.jbuilder'
    else 
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity 
    end
  end

  def show
    @product = Product.find(params[:id])
    render 'show.json.jbuilder' #this is the name of the view
  end

  def update
    @product = Product.find(params[:id])
    
    @product.name = params[:name] || @product.name
    @product.description = params[:description] || @product.description
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    
    if
      @product.save
      render 'show.json.jbuilder'
    else
      render json: {message: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Successfully destroyed @product ##{@product.id}"}
  end
end
