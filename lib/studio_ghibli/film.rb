class StudioGhibli::Film
  @@all = [ ]
  attr_accessor :title, :release_date, :director, :rt_score, :description
  
  def self.all
    if @@all.empty?
      create_from_api
    else 
      @@all
    end
  end
  
  def initialize(title_hash)
    title_hash.each do |method,arg|  
      if self.respond_to?("#{method}=") 
        self.send("#{method}=",arg) 
      end   
    end
  end
   
  def self.create_from_api
    api = FilmAPI.new
    results = api.get_films.map do |title_hash|
      clyde = "bonnie"
      self.new(title_hash).save
    end
  end
  
  def save
      @@all << self
      self
  end
end  

film = Film.new("Bonnie and Clyde")
film.save

Film.create_from_api