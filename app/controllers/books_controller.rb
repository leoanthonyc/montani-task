class BooksController < ApplicationController
  def show
    isbn_13 = params[:id]
    unless validate_isbn_13(isbn_13)
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

  private

  # Got this from https://github.com/zapnap/isbn_validation/blob/master/lib/isbn_validation.rb
  ISBN13_REGEX = /^(?:\d[\ |-]?){13}$/i
  def validate_isbn_13(isbn)
    if isbn.match(ISBN13_REGEX)
      isbn_values = isbn.upcase.gsub(/\ |-/, '').split('')
      return false if !isbn_values[0..2].join('').match(/(978|979)/)
      check_digit = isbn_values.pop.to_i # last digit is check digit

      sum = 0
      isbn_values.each_with_index do |value, index|
        multiplier = (index % 2 == 0) ? 1 : 3
        sum += multiplier * value.to_i
      end

      result = (10 - (sum % 10))
      result = 0 if result == 10

      result == check_digit
    else
      false
    end
  end
end
