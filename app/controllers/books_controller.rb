class BooksController < ApplicationController
  def index
  end

  def show
    isbn_13 = params[:id]
    unless ISBN.valid?(isbn_13)
      head :bad_request 
      return
    end

    @book = Book.find_by(isbn_13: isbn_13)
    if @book
      respond_to do |format|
        format.html
        format.json do
          render json: {
            "authors": @book.authors.map(&:full_name).join(","),
            "publisher": @book.publisher.name
          }
        end
      end
    else
      respond_to do |format|
        format.html do
          flash[:error] = "ISBN does not match any book from our repository"
        end
        format.json { head :not_found }
      end
    end
  end
end
