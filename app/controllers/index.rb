get '/' do
  @url = Url.all
  erb :index
end

post '/urls' do
  @url = Url.all
  @new_url = Url.new(:long_url => params[:long_url])
  @new_url.save
  
  erb :index
end

get '/:short_url' do
  url = Url.where("short_url = ?", params[:short_url]).first
  url.increment_click
  redirect "#{url.long_url}"
end

