class Movie < ActiveRecord::Base
  after_commit :async_get_cover, on: :create

  def async_get_cover
    CoversWorker.perform_async(id)
  end
end
