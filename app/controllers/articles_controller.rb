class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end
    
    def index
        @article = Article.all
    end
    
    def new
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def create
        @article = Article.new(params.require(:article).permit(:title, :description))   
#        render plain:@article.inspect
        if @article.save 
            flash[:notice] = "Article was saved succesfully"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def update
        @article = Article.find(params[:id])
        #require statement is to whitelist was is acceptable parameters for the patch request
        if @article.update(params.require(:article).permit(:title, :description))
          flash[:notice] = "Article was updated successfully."
          redirect_to @article
        else
          render 'edit'
        end
    end
end