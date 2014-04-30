class Movie < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks
  after_commit :async_get_cover, on: :create

  def async_get_cover
    CoversWorker.perform_async(id)
  end

  mapping do
    indexes :id,           :index    => :not_analyzed
    indexes :title,        :analyzer => 'snowball', :boost => 100
  end
end
