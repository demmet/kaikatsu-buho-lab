defmodule Uno do
  def card_type(number) do
    case number do
      1 ->
        "one"
      2 ->
        "two"
      3 ->
        "three"
      4 ->
        "four"
      5 ->
        "five"
      6 ->
        "six"
      7 ->
        "seven"
      8 ->
        "eight"
      9 ->
        "nine"
      10 ->
        "reverse"
      11 ->
        "block"
      12 ->
        "plus-two"
      13 ->
        "wild"
      14 ->
        "wild-plus-four"
    end
  end

  def card_color(number) do
    case number do
      1 ->
        "red"
      2 ->
        "yellow"
      3 ->
        "green"
      4 ->
        "blue"
      5 ->
        ""
    end
  end

  defmodule Card do
    defstruct card_type: Uno.card_type(13), card_color: Uno.card_color(4)
  end

  def generate_random_card do
    card_type_number = :rand.uniform(14)
    IO.inspect(card_type_number)


    card_color_number =
      if card_type_number < 13 do
        :rand.uniform(4)
      else
        5
      end

    %Uno.Card{ card_type: Uno.card_type(card_type_number), card_color: Uno.card_color(card_color_number) }
  end

  def print_card(card) do
    case String.length(card.card_color) do
      0 ->
        card.card_type
      _ ->
        card.card_color <> " " <> card.card_type
    end
  end

  def generate_random_hand do
    hand = []
    hand = hand ++ [Uno.generate_random_card]
    hand = hand ++ [Uno.generate_random_card]
    hand = hand ++ [Uno.generate_random_card]
    hand = hand ++ [Uno.generate_random_card]
    hand = hand ++ [Uno.generate_random_card]
    hand = hand ++ [Uno.generate_random_card]
    hand = hand ++ [Uno.generate_random_card]
    hand
  end

  def playable_from_hand?(card, hand) do

  end
end
