class V1::BooksController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  
  #Return all records actions
  def index
    @books = Book.all
    render json: @books, status: :ok
  end

  # Show actions
  def show
    render json: Book.find(params[:id])
  end

  def create
    book = Book.create!(book_params)
    render json: book, status: :created
  end

  def update
    book = Book.find(params[:id])
    book.update!(book_params)
    render json: book
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    head :no_content
  end

  private
  
  def book_params
    params.require(:book).permit(:book_name, :book_title, :author_name)
  end

  def render_not_found_response
    render json: { error: "Book Not Found" }, status: :not_found
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
