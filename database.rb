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
  attr_reader "search_name", "found"

  def initialize
    @person_array = []
    # @search_name = search_name
    @found = found
  end

  def add_person
    loop do
      print "Please input a name: "
      name = gets.chomp.capitalize

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

  end

  def search_person
    found = false
    puts "Please input the name of the person you want to search"
    search_person = gets.chomp.capitalize

    @person_array.each do |person|
      if person.name == search_person
        found = true
        puts "This is #{person.name}'s information.
        \nName: #{person.name}
        \nPhone: #{person.phone_number}
        \nAddress: #{person.address}
        \nPosition: #{person.position}
        \nSalary: #{person.salary}
        \nSlack Account: #{person.slack_acct}
        \nGitHub Account: #{person.github_acct}"
      end
    end

    if found == false
      puts "#{search_person} is not in our system.\n"
    end
  end

  def delete_person
    puts "delete"
  end
end

def quit_program
  puts "Thank you for your input."
end

class Menu
  def initialize
    @database = Database.new
    @menu = true
  end

  def menu_selection
    while @menu == true
      puts "\nPlease type what you would like to do: "
      puts %{
        A: Add a person
        S: Search for a person
        D: Delete a person
        Q: Quit
      }
      print ">> "
      selected = gets.chomp.downcase

      if selected == "a"
        @database.add_person
      elsif selected == "s"
        @database.search_person
      elsif selected == "d"
        @database.delete_person
      elsif selected == "q"
        quit_program
        @menu = false
      else
        puts "Please only select: A | S | D | Q"
      end
    end
  end
end

instance = Menu.new

instance.menu_selection
