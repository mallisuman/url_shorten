class LinksController < ApplicationController
  def index
  	
  end

  def show
  	@link = Link.find(params[:id])
  	url_extension = @link.code
  	@short_url = "http://localhost:3000/#{url_extension}"
  end

  def create
  
  	@link = Link.new(link_params)
    @link.code = (0...8).map { (65 + rand(26)).chr }.join

  	if @link.save
  	  redirect_to @link 	
  	else
  	  redirect_to 'lniks/index'	
  	end
  end

  def send_to_url
    code = params[:abc]
    link = Link.where(code: code).last
    
  
    current_time = Time.now
    link_age = current_time - link.created_at

    if link_age > 2.minutes
      redirect_to root_path, notice: "link expired"
    else
      redirect_to link.original_url  
    end
  end

  private
    def link_params
      params.require(:link).permit(:original_url, :code)	
    end
end
