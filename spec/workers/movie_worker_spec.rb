require 'spec_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

describe CoversWorker do
  it 'appends cover after save using sidekiq' do
      movie = FactoryGirl.create(:movie)
      expect { CoversWorker.perform_async(movie.id) }.to change(CoversWorker.jobs, :size).by(1)
  end
end
