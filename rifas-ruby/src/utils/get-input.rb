def get_input(question, error_message = "Input obrigatório")
  print question
  answer = $stdin.gets.chomp.strip

  return answer.strip
end
