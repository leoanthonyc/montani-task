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
end
