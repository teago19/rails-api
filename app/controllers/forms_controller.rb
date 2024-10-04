class FormsController < BaseCrudController
  def create
    new_crud_instance = crud_model.create()
    
    create_params['question_ids'].each do |question_id|
      new_form_question = FormQuestion.create!(form_id: new_crud_instance.id, question_id: question_id)
    end
    
    if new_crud_instance.errors.present?
      render json: new_crud_instance.errors.messages, status: 422
    else
      render json: new_crud_instance.to_json(methods: :questions), status: 200
    end
  end

  def answer
    form = Form.find_by(id: params[:form_id])
    
    answers = params['answers']
    answers.each do |answer_data|
      QuestionUser.create(user_id: 1, question_id:answer_data['question_id'], answer: answer_data['answer'] )
    end
  end
  
  def crud_model
    Form
  end

  def create_params
    params.permit([
      question_ids: []
    ])
  end
end
