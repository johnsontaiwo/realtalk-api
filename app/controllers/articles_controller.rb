class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
    render json: @article
  end

  def index
    @articles = Article.all
    render json: @articles
  end

def create
    @article = Article.create(article_params)
    if @article.save
      render json: @article
      else
      render json: @article.errors, status: :unprocessable_entity
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
      render :json=> @article.errors, :status=>422
    end
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    if @article.destroy
      render :json=> { success: 'article was successfully deleted' }, :status=>201
    else
      render :json=> { error: 'article could not be deleted' }, :status=>422
    end
  end
 
 private

  def article_params
    params.require(:article).permit(:title, :content, :author_name)
  end

end
