class CommentsController < ApplicationController
	before_action :require_login, except: [:create]
	include CommentsHelper
	def create
	  @comment = Comment.new(comment_params)
	  @comment.article_id = params[:article_id]

	  if @comment.save
	  	flash.notice = "you commented on article '#{@comment.article.title}'"
	  	redirect_to article_path(@comment.article)
	  else
	  	flash.notice = "your comment is not published: \"Author_name must be of 5-20 characters and your comment must be of 10-100 characters\" "
	  	redirect_to article_path(@comment.article)
	  end
	end
end
