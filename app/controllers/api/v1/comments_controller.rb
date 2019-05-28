require 'pry'
class Api::V1::CommentsController < ApplicationController

 before_action :find_article
  
  def index
    @comments = @article.comments
    render json: @comments
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
        render :json=> @article.errors
      end
    end
 end

  def show
    if params[:article_id]
      @comment = @article.comments.find_by(:id => params[:id])
      render json: @comment
    end
  end

  def update
    @comment = @article.comments.find_by(:id => params[:id])
    if @comment.update_attributes(comment_params)
      render json: @comment 
    else
    render :json=> { success: 'comment could not be updated' }, :status=>201
    end
  end

  def destroy
    @comment = @article.comments.find_by(:id => params[:id])
    if @comment.destroy
      render json: @comment 
    else
    render :json=> { success: 'comment could not be deleted' }, :status=>201
    end
  end

  private

  def find_article
    @article = Article.find_by(:id => params[:article_id])
  end


  def comment_params
    params.require(:comment).permit(:content, :commentator, :like)
  end

end
  
