# require './person'
# require './book'
# require './rental'
# require './student'
# require './teacher'
# class App
#   def initialize
#     @people = []
#     @books = []
#     @rentals = []
#   end

#   # rubocop:disable Metrics/CyclomaticComplexity
#   def main
#     loop do
#       homepage
#       selected_option = gets.chomp.to_i
#       case selected_option
#       when 1 then list_all_books
#       when 2 then list_all_people
#       when 3 then create_teacher_or_student
#       when 4 then create_a_book
#       when 5 then create_rental
#       when 6 then list_rentals_for_a_person
#       when 7
#         puts 'Thanks for using this app'
#         exit
#       else puts 'Error: Enter a valid option.'
#       end
#     end
#   end

  # rubocop:enable Metrics/CyclomaticComplexity
  private

  def homepage
    puts 'Welcome to school library App'
    puts 'Please choose an option by entering in a number'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person(teacher or student, not a plain person)'
    puts '4. Create a book'
    puts '5. Create rental'
    puts '6. List rentals for a given person id'
    puts "7. Quit\n"
  end

  def list_all_books
    puts 'List of all books'
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}\n"
      puts
    end
  end

  def list_all_people
    puts 'List of all people'
    @people.each do |person|
      puts "[#{person.class}] name: #{person.name}, ID: #{person.id}, age: #{person.age}\n"
      puts
    end
  end

  def create_teacher_or_student
    puts 'Press 1 to create a Teacher or 2 to create a Student'
    number_entered = gets.chomp.to_i
    case number_entered
    when 1 then create_a_teacher
    when 2 then create_a_student
    else
      puts 'You can only create a teacher(1) or student(2)'
    end
    puts
  end

  def create_a_teacher
    puts 'Creating a new teacher...'
    puts "Enter the teacher's name:"
    name = gets.chomp
    puts "Enter the teacher's age:"
    age = gets.chomp.to_i
    puts "Enter the teacher's specialization:"
    specialization = gets.chomp

    teacher = Teacher.new(age, name, specialization)
    @people << teacher
    puts "#{teacher.name} who specializes in #{teacher.specialization} has been created successfully.\n"
    puts
  end

  def create_a_student
    puts 'Creating a new student...'
    puts "Enter the student's name:"
    name = gets.chomp
    puts "Enter the student's age:"
    age = gets.chomp.to_i
    puts "Do the student have parent's permission? (y/n)"
    parent_permission = gets.chomp.downcase == 'y'

    student = Student.new(age, name, parent_permission)
    @people << student
    puts "#{student.name} has been created successfully.\n"
  end

  def create_a_book
    puts 'Creating a new book...'
    puts "Enter the book's title:"
    title = gets.chomp
    puts "Enter the book's author:"
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts "#{book.title} has been created successfully.\n"
    puts
  end

  def create_rental
    puts 'Select a book by entering the corresponding number:'
    @books.each.with_index(1) do |book, i|
      puts "#{i}. #{book.title} by #{book.author}"
    end
    selected_book = gets.chomp.to_i
    book = @books[selected_book - 1]
    if book.nil?
      puts 'Invalid book selection'
      return
    end

    puts 'Select a person by entering the corresponding number:'
    @people.each.with_index(1) do |person, i|
      puts "#{i}. [#{person.class}] name: #{person.name}, ID: #{person.id}, age: #{person.age}"
    end
    selected_person = gets.chomp.to_i
    person = @people[selected_person - 1]
    if person.nil?
      puts 'Invalid person selection.'
      return
    end

    puts 'Enter rental start date(yyyy-mm-dd):'
    entered_date = gets.chomp
    date = entered_date
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts "Rental created successfully\n"
    puts
  end

  def list_rentals_for_a_person
    puts 'Enter the ID of the person:'
    person_id = gets.chomp.to_i
    person = person_by_id(person_id)
    if person.nil?
      puts "Person with ID #{person_id} does not exist, cannot list rentals."
      return
    end

    rentals = @rentals.select { |rental| rental.person == person }
    rentals.each do |rental|
      puts "Rentals:\n Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}\n"
      puts
    end
  end

  def person_by_id(id)
    @people.find { |person| person.id == id }
  end
end
