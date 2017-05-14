class ArticlesController < ApplicationController

	before_action :set_article, only: [:edit, :update, :show ,:destroy]
	
	def new
		@article = Article.new
	end
	def create
		#creating new article first and whitelisting it
		
		@article = Article.new(article_params)
		
		if @article.save
			flash[:success]="Article was sucessfully created"
			redirect_to article_path(@article)
		else
			render 'new'
		end	
	end
	#showing article after sucess
	def show
		
	end
	
	
	def destroy
		@article.destroy
		flash[:danger] = "Articles was sucessfully deleted!"
		
		redirect_to articles_path
	end
	
	
	def edit
	end
	
	def update
		if @article.update(article_params)
			flash[:success]="Article Updated Sucessfully!"
			redirect_to article_path(@article)
		else
			render'edit'
		end	
	end
	
	
	
	
	def index
		@article = Article.all
	end
	private
	
		def set_article
			@article = Article.find(params[:id])
		end
	
		def article_params
			params.require(:article).permit(:title, :description)
		end	
end
