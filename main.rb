require_relative 'app'

def item_list
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def option_case
  options = { 1 => :all_books,
              2 => :all_people,
              3 => :create_person,
              4 => :create_book,
              5 => :create_rental,
              6 => :all_rentals_for_id,
              7 => :quit_mode }

  loop do
    item_list
    option = gets.chomp.to_i
    method = options[option]
    if method == :quit_mode
      puts 'Thanks for using this app'
      break
    end

    send(method)
  end
end

def main
  app = App.new
  app.start
end

main
