require 'sinatra'
require_relative 'models/product.rb'

helpers do
  def titlecase(title)
    title != 'us' ? title.capitalize : title.upcase
  end
end

get '/' do
  # HOME LANDING PAGE SHOWING BANNER PHOTO, TITLE, AND SUBTITLE
  @page_title = "Home"
  erb :index
end


get '/team' do
  # TEAM PAGE LISTING THE TEAM MEMBERS
  @page_title = "The Team"
  erb :team
end

get '/products' do
  # PRODUCTS PAGE LISTING ALL THE PRODUCTS
  @page_title = "All Locations"
  @products   = Product.sample_locations

  erb :products
end

get '/products/location/:location' do
  # PAGE DISPLAYING ALL PHOTOS FROM ONE LOCATION
  @page_title = (params[:location] != 'us' ? @page_title.capitalize : @page_title.upcase)
  @products   = Product.find_by_location(params[:location])

  erb :category
end

get '/products/:id' do
  # PAGE DISPLAYING ONE PRODUCT WITH A GIVEN ID
  @product    = Product.find(params[:id])
  @page_title = @product.title

  erb :single
end
