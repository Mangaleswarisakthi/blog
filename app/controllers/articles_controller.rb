class ArticlesController < ApplicationController
 http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show, :delete]
def new
@article=Article.new
end
def index
	@articles=Article.all
end
def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end

def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    flash[:success] = "Your Article Successfully Updated!"
    redirect_to @article
  else
    flash[:error] = "Updation is Failed!"
    render 'edit'
  end
end
def edit
@article=Article.find(params[:id])
end
def create
  @article = Article.new(article_params)


  if @article.save
	flash[:success] = " Your Article is Successfully Created!"
	  redirect_to @article
  end
end
def show
@article=Article.find(params[:id])
end
private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
