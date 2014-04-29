require 'spec_helper'
require 'sidekiq/testing'

describe MoviesController do

  describe 'new' do

    it 'appends cover after save using sidekiq' do
        movie = FactoryGirl.build(:movie)
        expect { HardWorker.perform_ascync(movie.id) }.to change{movie.cover}.from("").to("https://image.tmdb.org/t/p/w92")
        # Confirm that the cover image was saved into public folder
    end
  end

end