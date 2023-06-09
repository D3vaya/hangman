defmodule Hangman.View do
  @moduledoc """
  Presentation layer for the hagman game
  """
  alias Hangman.State

  @doc """
    Return a human-friendly response
  """
  def format_response(%State{limit: limit, completed?: false} = state) when limit > 0 do
    {mask_word(state), state}
  end

  def format_response(%State{word: word, limit: limit} = state) when limit > 0 do
    {"You won, word was: #{word}", state}
  end

  def format_response(%State{word: word} = state) do
    {"Game Over word was: #{word}", state}
  end

  def mask_word(%{matches: matches, word: word, mask: mask} = _state) do
    if MapSet.size(matches) > 0 do
      matches = Enum.join(matches)
      String.replace(word, ~r/[^#{to_string(matches)}]/, mask)
    else
      String.replace(word, ~r/./, mask)
    end
  end
end
