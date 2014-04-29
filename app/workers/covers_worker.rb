require 'open-uri'

class CoversWorker
  include Sidekiq::Worker

  def perform(movie_id)
    movie = Movie.find(movie_id)
    uri = URI.parse("https://api.themoviedb.org/3/search/movie?query=#{URI.escape(movie.title)}&api_key=fb727befeb3e67a322f39af6703bceb5")
    request = Net::HTTP.get_response(uri)
    img_path = JSON.parse(request.body)["results"][0]["poster_path"]
    cover_path = "https://image.tmdb.org/t/p/w92" + img_path
    movie.update_attribute(:cover, cover_path)
    open("#{Rails.root}/public/assets/covers/#{img_path[1..-1]}", 'wb') do |file|
      file.write(open("#{cover_path}").read)
    end
  end
end