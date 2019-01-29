class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
      flash[:notice] = "The article was successfully created."
    else
      render 'new'
    end

    def show
      @article = Article.find(params[:id])
    end
  end
  private
  def article_params
    params.require(:article).permit(:title, :desciption)
  end

end
