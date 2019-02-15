class ArticlesController < ApplicationController
	include ArticlesHelper
	def index
		@articles=Article.all
	end
	def show
		@article=Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end
	def new
		@article=Article.new
	end
	# def create
	# 	@article=Article.new(article_params)
	# 	@article.save
	# end
	def create
  		@article = Article.new(article_params)
  		@article.title.capitalize!
  		@article.save
  		flash.notice = "your article '#{@article.title}' was created"
  		redirect_to articles_path(@article)
	end

	def edit
		@article=Article.find(params[:id])
		@article.title.capitalize!
	end

	def update
		@article=Article.find(params[:id])
		@article.update(article_params)
		@article.title.capitalize!
		@article.save

		flash.notice = "your article '#{@article.title}' was updated"
		redirect_to articles_path(@article)	

	
	end

	def destroy
		@article =Article.find(params[:id])
		@article.destroy
		flash.notice = "your article '#{@article.title}' was destroyed"
		redirect_to articles_path
	end

end
