class ArticlesController < ApplicationController

	before_action :set_article, only: [:edit, :update, :show ,:destroy]
	before_action :require_user, except: [:show, :index]
	before_action :require_same_user, except: [:show, :index, :new, :create]
	
	def index
		@articles = Article.order('articles.created_at DESC').paginate( page: params[:page], per_page: 5 )
		
	end
	
	def new
		@article = Article.new
	end
	
	def create
		#creating new article first and whitelisting it
		
		@article = Article.new(article_params)
		@article.user = current_user
		
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
	
	
	
	
	
	private
	
		def set_article
			@article = Article.find(params[:id])
		end
	
		def article_params
			params.require(:article).permit(:title, :description, :image, category_ids: [])
		end	
		
		def require_same_user
		  if current_user != @article.user and !current_user.admin?
		    flash[:danger] = "You can only edit or delete your own article."
		    redirect_to root_path
		  end
		end
		
end
