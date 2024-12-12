class BooksController < ApplicationController
  def index
    @books = Book.all

    render json: @books
  end

  def create
    user_id = 1
    book = Book.create(book_params.merge(user_id: user_id))
    book.save
    if book.valid?
      render json: book, status: :created
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    Book.update(params)
  end

  def destroy
    Book.destroy(params)
  end

  def popular
    popular_books = Rails.cache.fetch("popular_books", expires_in: 12.hours) do
      Book.order(average_rating: :desc).limit(10)
    end
    render json: popular_books
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :rating, :status)
  end
end
