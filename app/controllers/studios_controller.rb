class StudiosController < BaseCrudController
  def crud_model
    Studio
  end

  # PERMITIR APENAS O NOME 
  def create_params
    params.permit([:name])
  end
end