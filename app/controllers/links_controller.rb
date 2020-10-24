class LinksController < ApplicationController
  def index
  	@links = Link.all
  end

  def show
  	@link = Link.find(params[:id])
  	url_extension = @link.code
  	@short_url = "http://localhost:3000/#{url_extension}"

    # id = params[:xyz]
    # link = Link.last

    # count_click = Link.short_url
    # count_click.count++
    # count_click.save
  
    

  end

  def create
   
  	@link = Link.new(link_params)
    @link.code = (0...8).map { (65 + rand(26)).chr }.join

  	if @link.save
      @url = "http://localhost:3000/#{@link.code}"
  	  render 'create' 	
  	else
  	  redirect_to 'lniks/index'	
  	end
  end

  def send_to_url
    
    code = params[:abc]
    link = Link.where(code: code).last
    
    a = Analytic.new
    a.ip_address = request.remote_ip 
    a.country = Geocoder.search(request.remote_ip).last.country
    # a.country = request.location.country.remote_country
    a.link_id = link.id
    a.save  
    
    current_time = Time.now
    link_age = current_time - link.created_at

    if link_age > 2.minutes
      redirect_to root_path, notice: "link expired"
    else
      redirect_to link.original_url  
    end
  end

  def analytics
    @link = Link.where(id: params[:id]).last
    @analytics = @link.analytics
  end

  private
    def link_params
      params.require(:link).permit(:original_url)	
    end
end
