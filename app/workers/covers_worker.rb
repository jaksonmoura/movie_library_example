class CoversWorker
  include Sidekiq::Worker

  def perform(movie_id)
    movie = Movie.find(movie_id)

    # movie.update_attribute(:cover, )
  end
end