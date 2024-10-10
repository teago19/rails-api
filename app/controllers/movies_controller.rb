class MoviesController < BaseCrudController
  
  def like
    movie = Movie.find_by(id: params[:id])
    render json: {}, status: :ok
  end 
  
  def crud_model
    Movie
  end

  # permitir nome e released_at
  def create_params
    params.permit([:name, :released_at])
  end
end
