require 'spec_helper'

describe 'Movies' do

  before { @movie = FactoryGirl.create(:movie) }

  it 'index' do
    visit movies_path

    page.should have_content(@movie.title)
  end

  it 'show' do
    visit movie_path(@movie)
  end

  it 'creates a valid movie' do
    movie = FactoryGirl.build(:movie)
    visit new_movie_path

    fill_in 'Title', with: movie.title
    fill_in 'Release at', with: movie.release_at
    fill_in 'Summary', with: movie.summary
    fill_in 'Rate', with: movie.rate
    fill_in 'Duration', with: movie.duration

    expect{ click_button 'Save' }.to change(Movie, :count).by(1)
    current_path.should eq(movies_path)
  end

  it 'update a valid movie' do
    visit edit_movie_path(Movie.last)

    fill_in 'Title', with: 'Movie updated 1'

    click_button 'Save'

    current_path.should eq(movie_path(Movie.last))
    page.should have_content('Movie updated 1')
  end

  describe 'destroy' do
    before {@movie = FactoryGirl.create(:movie)}
    it "destroys the movie" do
      visit movie_path(@movie)

      expect { click_link 'Remove' }.to change(Movie, :count).by(-1)
      current_path.should eq(movies_path)
      page.should have_content('successfully removed')
    end
  end

end