class StudioGhibliController 
  
  def call
    puts "Welcome to the Studio Ghibli Movie Generator!"
    puts "To see information about a film, enter the film number from the list below."
    list_films
    menu
  end

  def list_films
    puts "-All Studio Ghibli Films-"
    @films = Film.all
    @films.each.with_index do |film, i|
      puts "#{i+1}. #{film.title}"
    end
  end
   
  def menu
    input = nil
    while input != 'exit'
      puts "To generate a random film suggestion, enter 'random'."
      puts "To see the film list again, type 'list films'"
      puts "To quit, type 'exit'."
      input = gets.chomp
      
      if input.to_i > 0
        the_film = @films[input.to_i-1] 
        film_info(the_film)
      elsif input == "list films"
        list_films
      else input == "exit"
        goodbye
        case input
        when 'random'
          puts "Ah, a classic! Grab some popcorn, you're in for a treat."
          generate_random_film
        end
      end
    end
  end

  def goodbye
    puts "See you next time!"
  end

  def film_info(film)
    puts " TITLE: " "#{film.title}"
    puts " RELEASE DATE:"  " #{film.release_date}"
    puts " DIRECTOR:"  " #{film.director}"
    puts " ROTTEN TOMATOES SCORE:"  " #{film.rt_score}"
    puts " DESCRIPTION:"  " #{film.description}"
  end

  def generate_random_film
    film = Film.all.sample
    puts " TITLE: " "#{film.title}"
    puts " RELEASE DATE:"  " #{film.release_date}"
    puts " DIRECTOR:"  " #{film.director}"
    puts " ROTTEN TOMATOES SCORE:"  " #{film.rt_score}"
    puts " DESCRIPTION:"  " #{film.description}"
  end
end