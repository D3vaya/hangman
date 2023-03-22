check = fn attemps ->
  {_, state} = Hangman.start_game()

  Enum.reduce(attemps, state, fn letter, state ->
    {word, state} = Hangman.take_a_guess(letter, state)
    IO.puts(word)
    state
  end)
end

IO.puts("WIN")
check.(["h", "a", "n", "g", "m"])
IO.puts("Game Over")
check.(["z", "q", "f", "g", "m"])
