class CommentsController < ApplicationController
 before_action :find_article
  
  def index
    @articles = Article.all
    if params[:article_id]
        @comments = @article.comments.all
        render json: @comments
    end
  end

  def new 
    @comment = Comment.new
    if params[:article_id]
      @comment = @article.comments.build
      render json: @comment
    end
  end
 
 def create
  if params[:article_id]
      @comment = @article.comments.create(comment_params)
      if @comment.save
        render json: @comment
      else
        render :json=> @article.errors, :status=>422
      end
    end
 end
  
def show
    if params[:article_id]
      @comment = @article.comments.find_by(:id => params[:id])
    end
  end

  def destroy
    @comment = @article.comments.find_by(:id => params[:id])
    @comment.destroy
    render :json=> { success: 'article was successfully deleted' }, :status=>201
  end

  private
  
  def find_article
    @article = Article.find_by(:id => params[:article_id])
  end
  
  
  def comment_params
    params.require(:comment).permit(:content)
  end

end
