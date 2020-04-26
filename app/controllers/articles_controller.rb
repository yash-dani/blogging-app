class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comment.article_id = @article.id
    end
    def new
        @article = Article.new
    end
    def create
        @article = Article.new(
            title: params[:article][:title],
            body: params[:article][:body])
        @article.save
        flash.notice = "Article Created"
        redirect_to article_path(@article)
    end
    def destroy
        @article = Article.destroy(params[:id])
        flash.notice = "Article Deleted"
        redirect_to action: "index"
    end
    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        flash.notice = "Article Updated"
        redirect_to article_path(@article)
    end
    private
    def article_params
        params.require(:article).permit(:title, :body) 
    end
end
