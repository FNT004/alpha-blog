class ArticlesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]
    before_action :correct_user, only: [:edit, :update, :destroy]
    
    
    def new

       # @article = Article.new
       @article = current_user.articles.build

    end

    def index
        @articles = Article.all
    end

    def create
        
        #@article = Article.new(article_params)
        @article = currect_user.articles.build(article_params)

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

    def edit

        @article = Article.find(params[:id])

    
    end

    def update

        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "article updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end

    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article was deleted"
        redirect_to articles_path

    end

    def correct_user   
        @article = current_user.articles.find_by(id: params[:id])
        redirect_to articles_path, notice: "Not Authorised " if @article.nil?
    end

    private

    def article_params
        params.require(:article).permit(:title, :description, :user_id)
    end
    
end