# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Author.create([
  { first_name: "David", last_name: "Epstein", middle_name: nil},
  { first_name: "Khaled", last_name: "Hosseini", middle_name: nil},
  { first_name: "Rolf", last_name: "Dobelli", middle_name: nil},
  { first_name: "Nassim", last_name: "Taleb", middle_name: "Nicholas"},
  { first_name: "Robin", last_name: "Sharma", middle_name: nil}
])

Publisher.create([
  { name: "Random House" },
  { name: "Anchor Books" },
  { name: "Harcourt" },
  { name: "Harper Collins" },
  { name: "Riverhead Books" },
])

Book.create([
  { title: "Range", isbn_13: "9781509843527", list_price: 1, publication_year: "2022-01-01", publisher: Publisher.last, author: Author.first},
  { title: "The Kite Runner", isbn_13: "9780385660075", list_price: 1, publication_year: "2022-01-01", publisher: Publisher.last, author: Author.second},
  { title: "The Art of Thinking Clearly", isbn_13: "9785268579451", list_price: 1, publication_year: "2013-01-01", publisher: Publisher.fourth, author: Author.third},
  { title: "The 5AM Club", isbn_13: "9781443456623", list_price: 1, publication_year: "2018-01-01", publisher: Publisher.fourth, author: Author.last},
  { title: "Antifragile", isbn_13: "9780812979688", list_price: 1, publication_year: "2014-01-01", publisher: Publisher.fourth, author: Author.fourth},
])
