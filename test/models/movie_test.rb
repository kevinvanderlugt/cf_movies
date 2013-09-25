require "test_helper"

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @movie = Movie.create( title: "Saving Silverman" )
  end

  def test_valid
    assert @movie.valid?
  end

  def test_invalid_without_title
    @movie.title = nil
    refute @movie.valid?, "Movies must have a title"
  end

  def test_invalid_with_small_title
    @movie.title = "AAA"
    refute @movie.valid?, "Movies must have a title longer than 3 characters"
  end
end
