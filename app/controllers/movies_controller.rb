MyApp.get "/" do
  @movies = Movie.all
  x       = Movie.ids.sample(2)

  @movie_1 = @movies.find_by_id(x[0])
  @movie_2 = @movies.find_by_id(x[1])

  erb :"user/ballot_box"
end

MyApp.get "/add_movies" do
  @movies = Movie.all
  @movie  = Movie.new
  
  erb :"admin/add_movies"
end

MyApp.post "/add_movie_form" do
  @movies = Movie.all
  @movie  = Movie.new

  @movie.movie_title = (params["movie_title"])
  @movie.save

  erb :"admin/add_movies"
end

MyApp.post "/delete_movie/:movie_id" do
  @movies = Movie.all
  @movie  = Movie.find_by_id(params[:movie_id])
  
  @movie.delete
    
  erb :"admin/add_movies"
end

MyApp.get "/update_movie/:movie_id" do
  @movies = Movie.all
  @movie  = Movie.find_by_id(params[:movie_id])

  erb :"admin/update_movie"
end

MyApp.post "/process_movie_update/:movie_id" do
  @movies = Movie.all
  @movie  = Movie.find_by_id(params[:movie_id])

  @movie.movie_title = (params["movie_title_update"])
  @movie.save

  erb :"admin/add_movies"
end