def get_required_input(question, error_message = "Input obrigatório")
  while true
    print question

    answer = $stdin.gets.chomp.strip

    if answer
      return answer
    end

    puts error_message
  end
end
