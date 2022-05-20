class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def new

        @article = Article.new

    end

    def create
        
        @article = Article.new(article_params)

        if @article.save
            
            flash[:notice] = "Article Created"
            redirect_to article_path(@article)
            
        else
            render json: @article.errors.full_messages,status: :unprocessable_entity
        end

    end

    def show
        
        @article = Article.find(params[:id])

    end

    private

    def article_params
        params.require(:article).permit(:title, :description)
    end
    
end