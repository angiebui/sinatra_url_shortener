get '/' do
  @url = Url.order("click_count DESC").limit(5)
  erb :index
end

post '/urls' do
  @url = Url.order("click_count DESC").limit(5)
  @new_url = Url.new(:url => params[:url])
  @new_url.save
  erb :index
end

get '/:short_url' do
  url = Url.find_by_short_url(params[:short_url])
  url.increment_click!
  redirect url.url
end
