class ArticlesController < ApplicationController
	def new
		@article = Article.new
	end
	def create
		#creating new article first and whitelisting it
		@article = Article.new(article_params)
		if @article.save
			flash[:notice]="Article was sucessfully created"
			redirect_to article_path(@article)
		else
			render 'new'
		end	
	end
	#showing article after sucess
	def show
		@article = Article.find(params[:id])
	end
	#article_params
	
	private
		def article_params
			params.require(:article).permit(:title, :description)
		end	
end
