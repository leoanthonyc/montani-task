class IsbnController < ApplicationController
  def toggle
    isbn = params[:isbn]
    unless ISBN.valid?(isbn)
      head :bad_request
      return
    end

    other_isbn = 
      if isbn.length == 13
        ISBN.ten(isbn)
      else
        ISBN.thirteen(isbn)
      end
    render json: { isbn: other_isbn }.to_json
  end

  def search
    isbn = params[:isbn].delete(' ', '-')
    if ISBN.valid?(isbn)
      isbn_13 = 
        if isbn.length == 13
          isbn
        else
          ISBN.thirteen(isbn)
        end
      if Book.exists?(isbn_13: isbn)
        redirect_to "/books/#{isbn_13}"
      else
        redirect_back fallback_location: root_path, alert: "ISBN does not match any book from our repository"
      end
    else
      redirect_back fallback_location: root_path, alert: "Invalid ISBN"
    end
  end
end
