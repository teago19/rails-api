class Form < ApplicationRecord
  has_many :form_questions

  before_create :set_version
  # after_create :generate_questions


  def questions
    questions_ids = self.form_questions.pluck(:question_id)
    Question.where(id: questions_ids)
  end

  def set_version
    self.version = Form.all.count + 1
  end

  def generate_questions
    random_question_ids = Question.all.pluck(:id).sample(2)

    random_question_ids.each do |question_id|
      new_form_question = FormQuestion.create!(form_id: self.id, question_id: question_id)
    end
  end

end
