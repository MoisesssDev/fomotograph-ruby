require 'sinatra'
require_relative 'models/product.rb'

get '/' do
  ## HOME LANDING PAGE SHOWING BANNER PHOTO, TITLE, AND SUBTITLE
  @page_title = "Home"
  erb :index
end


get '/team' do
  # TEAM PAGE LISTING THE TEAM MEMBERS
  @page_title = "Team"
  erb :team
end

get '/products' do
  # PRODUCTS PAGE LISTING ALL THE PRODUCTS
  @products = Product.sample_locations
  @page_title = "Products"
  erb :products
end

get '/products/location/:location' do
   ## PAGE DISPLAYING ALL PHOTOS FROM ONE LOCATION
   @products = Product.find_by_location(params[:location])
   @page_title = params[:location]
   erb :category
end

get '/products/:id' do
  # PAGE DISPLAYING ONE PRODUCT WITH A GIVEN ID
  @product = Product.find(params[:id])
  @page_title = @product.title
  erb :single
end

get '/deals' do
  @products = Product.find_deals
  @page_title = "Deals"
  erb :deals
end