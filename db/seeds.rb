# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
UserBook.delete_all
Book.delete_all
User.delete_all

# Seed Users
users = [
  { email: 'alice@example.com', password: 'password123' },
  { email: 'bob@example.com', password: 'password123' },
  { email: 'carol@example.com', password: 'password123' }
]

users.each do |user_data|
  User.create!(user_data)
end

puts "Created #{User.count} users."

# Seed Books
books = [
  { title: 'The Hobbit', author: 'J.R.R. Tolkien', genre: 'Fantasy', average_rating: 4.8 },
  { title: '1984', author: 'George Orwell', genre: 'Dystopian', average_rating: 4.6 },
  { title: 'To Kill a Mockingbird', author: 'Harper Lee', genre: 'Fiction', average_rating: 4.9 },
  { title: 'Pride and Prejudice', author: 'Jane Austen', genre: 'Romance', average_rating: 4.5 },
  { title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', genre: 'Classic', average_rating: 4.3 }
]

books.each do |book_data|
  Book.create!(book_data)
end

puts "Created #{Book.count} books."

# Seed UserBooks (Associations)
user_books = [
  { user: User.first, book: Book.first, status: 'reading' },
  { user: User.first, book: Book.second, status: 'completed' },
  { user: User.second, book: Book.third, status: 'wishlist' },
  { user: User.third, book: Book.fourth, status: 'reading' },
  { user: User.third, book: Book.fifth, status: 'completed' }
]

user_books.each do |user_book_data|
  UserBook.create!(user_book_data)
end

puts "Created #{UserBook.count} user_book associations."
