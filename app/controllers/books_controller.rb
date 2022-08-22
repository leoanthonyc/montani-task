class BooksController < ApplicationController
  def index
  end

  def show
    isbn_13 = params[:id]
    unless ISBN.valid?(isbn_13)
      head :bad_request 
      return
    end

    book = Book.find_by(isbn_13: isbn_13)
    if book
      render json: {
        "authors": book.authors.map(&:full_name).join(","),
        "publisher": book.publisher.name
      }.to_json
    else
      head :not_found
    end
  end
end
