class BooksController < ApplicationController
  def index
    @books = Book.paginate(page: params[:page], per_page: 10)
    render json: {
      books: @books,
      meta: {
        current_page: @books.current_page,
        total_pages: @books.total_pages,
        total_books: @books.total_entries
      }
    }
  end

  def create
    book = Book.create(book_params)
    book.save
    if book.valid?
      render json: book, status: :created
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      render json: book, status: :ok
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      render json: { message: "Book successfully deleted" }, status: :ok
    else
      render json: { errors: "Failed to delete the book" }, status: :unprocessable_entity
    end
  end

  def popular
    popular_books = Rails.cache.fetch("popular_books", expires_in: 12.hours) do
      Book.order(average_rating: :desc).limit(10)
    end
    render json: popular_books
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :average_rating)
  end
end
