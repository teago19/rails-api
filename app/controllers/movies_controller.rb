class MoviesController < BaseCrudController
  def crud_model
    Movie
  end

  # permitir nome e released_at
  def create_params
    params.permit([:name, :released_at])
  end
end
