class CommentsController < ApplicationController
	include CommentsHelper
	def create
	  @comment = Comment.new(comment_params)
	  @comment.article_id = params[:article_id]

	  if @comment.save
	  	flash.notice = "you commented on article '#{@comment.article.title}'"
	  	redirect_to article_path(@comment.article)
	  else
	  	redirect_to article_path(@comment.article)
	  end
	end
end
