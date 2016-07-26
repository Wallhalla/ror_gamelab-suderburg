class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end
    
    # shows the "New" HTML for the controller´s model
    def new
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
            # error
        end
    end
    
    private 
        def article_params
            params.require(:article).permit(:title, :text)
        end
    
end
