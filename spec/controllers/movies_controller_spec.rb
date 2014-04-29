require 'spec_helper'
require 'sidekiq/testing'

describe MoviesController do

  # describe 'new' do

  #   it 'appends cover after save using sidekiq' do
  #       movie = FactoryGirl.create(:movie)
  #       expect { HardWorker.perform_ascync(movie.id) }.to change{movie.cover}.from().to()
  #       # Confirm that the cover image was saved into public folder
  #   end
  # end

end