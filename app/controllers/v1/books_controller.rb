class V1::BooksController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  
  # get all the books from record
  def index
    @books = Book.all
    render json: @books, status: :ok
  end

  # book Show actions
  def show
    render json: Book.find(params[:id])
  end
  
  # book create actions
  def create
    book = Book.create!(book_params)
    render json: book, status: :created
  end

  # book update actions
  def update
    book = Book.find(params[:id])
    book.update!(book_params)
    render json: book
  end

  # Book destroy actions
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
