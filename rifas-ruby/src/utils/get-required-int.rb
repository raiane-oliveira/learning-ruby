def get_required_int(question, error_message = "Número inválido!")
  while true
    print question

    answer = $stdin.gets.chomp.to_i

    if answer > 0 && answer.class == Integer
      return answer
    end

    puts error_message
  end
end
