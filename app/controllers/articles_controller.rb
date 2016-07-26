class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end
    
    # shows the "New" HTML for the controller´s model
    def new
        # create a default article object to have a valid one inside view
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    # does add a newly created model into the database
    def create
        
        # create a new article db object from the incoming (:article)
        @article = Article.new(article_params)

        # write it to DB
        if @article.save
             # redirect to the newly created article page (show action)
            redirect_to @article
        else
            render 'new'
        end
    end
    
    def update
        @article = Article.find(params[:id])
        
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        
        redirect_to articles_path
    end
    
    
    private 
        def article_params
            params.require(:article).permit(:title, :text)
        end
    
end
