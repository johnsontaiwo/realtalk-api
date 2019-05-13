 
class Api::V1::ArticlesController < ApplicationController

  before_action :find_user, except: [:show, :destroy]
    
  def new
    @article = Article.new
    render json: @article
  end

  def index
    @articles = Article.all
    render json: @articles
  end
      
  def create
    article = get_current_user.articles.build(article_params)
    if article.save
    render json: article
    else
    render :json=> { error: 'Signup or Login' }, :status=>422
    end
  end
      
  def show
    @article = Article.find_by(id: params[:id])
    render json: @article
  end

  def update
    @article = Article.find_by(id: params[:id])
    if @article.update_attributes(article_params)
      render json: @article
    else
      render :json=> @article.errors.message, :status=>422
    end
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    if @article.destroy
      render json: @article
    else
      render :json=> { error: 'article could not be deleted' }, :status=>422
    end
  end
      
 
  private

  def find_user
    @user = User.find_by(id:  params[:user_id])
  end
  

  def article_params
     params.require(:article).permit(:title, :content, :author_name, :like)
  end

end


       


  

