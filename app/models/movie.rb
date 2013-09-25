class Movie < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 4}
end
