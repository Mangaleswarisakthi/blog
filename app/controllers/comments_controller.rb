class CommentsController < ApplicationController
http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
before_action :authenticate_user!

def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
flash[:success] = " Your Command is Successfully added!"
  end
 def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.destroy
	flash[:success] = "Your Command removed successfully!"
else
	flash[:error] = "Failed!, Your Command not be Removed"
end
    redirect_to article_path(@article)
   
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
