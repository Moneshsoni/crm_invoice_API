class V1::CommentsController < ApplicationController
  
  before_action :find_article
  before_action :find_comment, only: [:show, :update, :destroy]

  def index
    @comments = @article.comments
    render json: @comments
  end

  def show
    render json: @comment
  end

  def create
    @comment = @article.comments.create(comment_params)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    binding.pry
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    binding.pry
    @comment.destroy
    head :no_content
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_comment
    @comment = @article.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
