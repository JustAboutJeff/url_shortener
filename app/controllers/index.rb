get '/' do
  # let user create new short URL, display a list of shortened URLs
  @url_list = Url.all
  @valid ||= true
  erb :index
end

# before do
# end

# error do
# end

post '/urls' do
  @new_url = Url.new({long_url: params[:long_url], click_count: 0})

  if @new_url.valid?
    @valid = true
    @new_url.save
    @url_list = Url.all
    erb :index
  else
    @valid = false
    erb :index
  end

end

# e.g., /q6bda
get '/:short_url' do
  @clicked_url = Url.find_by_short_url(params[:short_url])
  puts @clicked_url
  @clicked_url.click_count += 1
  @clicked_url.save
  puts @clicked_url.click_count
  redirect "#{@clicked_url.long_url}"
  # redirect to appropriate "long" URL
end
