class BloggersController < ApplicationController
  
  def index
    @bloggers = Blogger.all
  end
  
  def new 
    @blogger = Blogger.new
  end

  def show
    @blogger = Blogger.find(params[:id])
  end
  
  def create
    @blogger = Blogger.create(blogger_params)
    if @blogger.valid?
      redirect_to bloggers_path(@blogger)
    else
      flash[:errors] = @blogger.errors.full_messages 
      redirect_to new_bloggers_path
    end
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end
end
