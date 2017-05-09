class ArticlesController < ApplicationController
	def new
		@article = Article.new
	end
	def create
		#creating new article first and whitelisting it
		@article = Article.new(article_params)
		@article.save
		redirect_to aticle_show(@article)
	end
	
	#article_params
	
	private
		def article_params
			params.require(:article).permit(:title, :description)
		end	
end
