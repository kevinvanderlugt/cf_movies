class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_url
    else
      render 'new'
    end
  end

  def index
    @movies = Movie.all
  end

  private
    def movie_params
      params.require(:movie).permit(:title)
    end
end
