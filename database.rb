class Person
  attr_reader "name", "phone_number", "address", "position", "salary", "slack_acct", "github_acct"

  def initialize(name, phone_number, address, position, salary, slack_acct, github_acct)
    @name = name
    @phone_number = phone_number
    @address = address
    @position = position
    @salary = salary
    @slack_acct = slack_acct
    @github_acct = github_acct
  end
end

class Database
  def initialize
    @person_array = []
  end

  def add_person
    loop do
      print "Please input a name: "
      name = gets.chomp

      if name.empty?
        break
      end

      print "Input a phone number with area code, eg. 7278475464: "
      phone_number = gets.chomp.to_i

      print "Input the address, eg. 260 1st Ave S, St. Petersburg, FL 33701: "
      address = gets.chomp

      print "Input the position, eg. Instructor, Student, TA, or Campus Director: "
      position = gets.chomp

      print "Input the salary: "
      salary = gets.chomp.to_i

      print "Input the Slack account: "
      slack_acct = gets.chomp

      print "Input the GitHub account: "
      github_acct = gets.chomp

      person = Person.new(name, phone_number, address, position, salary, slack_acct, github_acct)

      @person_array << person
    end

    @person_array.each do |person|
      puts person.name
    end
  end

  def search_person
    puts "search"
  end

  def delete_person
    puts "delete"
  end
end

class Menu
  def initialize
    @database = Database.new
  end

  def menu_selection
    puts "Please type what you would like to do: "
    puts %{
      A: Add a person
      S: Search for a person
      D: Delete a person
    }
    print ">> "
    selected = gets.chomp.downcase

    if selected == "a"
      @database.add_person
    elsif selected == "s"
      @database.search_person
    elsif selected == "d"
      @database.delete_person
    else
      puts "Please only select: A | S | D"
    end
  end
end

instance = Menu.new

instance.menu_selection
