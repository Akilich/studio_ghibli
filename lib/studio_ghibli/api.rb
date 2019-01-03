class StudioGhibli::FilmAPI
  def get_films
    data = open("https://ghibliapi.herokuapp.com/films").read
    JSON.parse(data)
  end
end