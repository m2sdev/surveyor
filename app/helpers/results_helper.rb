module ResultsHelper
  def display_response(r_set,question)
    sets = r_set.responses.select{|r| r.question.id == question.id} # Replaced display_order with id
    if sets.size == 0
      return "-"
    elsif sets.size == 1
      return raw(sets.first.string_value || sets.first.text_value || sets.first.integer_value || show_answer(sets.first))
    else
      txt = ""
      sets.each do |set|
        txt << show_answer(set) + "<br/>"
      end
      return raw(txt)
    end
  end
  
  def show_answer(set)
     set.answer.text
  end
end