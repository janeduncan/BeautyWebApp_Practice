require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/beauty_product')
also_reload('./models/*')

# this is our INDEX route
get '/beauty-products' do
  @item = BeautyProduct.all()
  erb (:index)
end

# this is our NEW route
get '/beauty-products/new' do
  erb (:new)
end

# this is our EDIT route
get '/beauty-products/:id/edit' do
  @item = BeautyProduct.find(params[:id])
  erb (:edit)
end

# this is our SHOW route
get '/beauty-products/:id' do
  @item = BeautyProduct.find(params[:id])
  erb (:show)
end

# this is our CREATE route
post '/beauty-products' do
  @item = BeautyProduct.new(params)
  @item.save()
  erb (:create)
end

# this is our UPDATE route
post '/beauty-products/:id/update' do
  @item = BeautyProduct.new(params)
  @item.update()
  redirect '/beauty-products'
end
#
# this is our DELETE route
post '/beauty-products/:id/delete' do
  @item = BeautyProduct.find(params[:id])
  @item.delete()
  redirect '/beauty-products'
end
#
# post '/beauty-products/' do
#   "Hello World"
# end
