require "test_helper"

class MoviesControllerTest < ActionController::TestCase
  # test "sanity" do
  #   flunk "Need real tests"
  # end

  def test_new
    get :new
    assert_response 200
    assert_select 'h1', /Add Movie/
    assert_select 'form'
  end

  def test_create
    assert_difference 'Movie.count' do
      post :create, movie: { title: "Movie about unit tests" }
    end
    assert_redirected_to movies_url
  end

  def test_create_with_invalid_movie
    assert_no_difference 'Movie.count' do
      post :create, movie: { title: "" }
    end
    assert_template 'new'
  end

  def test_index
    get :index
    assert_response 200
    assert_select 'h1', /All Movies/
  end
end
