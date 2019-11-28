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
    defstruct card_type: "", card_color: ""
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

  def card_to_string(card) do
    case String.length(card.card_color) do
      0 ->
        card.card_type
      _ ->
        card.card_color <> " " <> card.card_type
    end
  end

  def print_card(card) do
    IO.inspect(card_to_string(card))
  end

  def print_hand(hand) do
    IO.puts("Current hand:")
    hand_string = print_hand(hand, length(hand))
  end

  def print_hand(hand, hand_size) when hand_size <= 1 do
   IO.inspect(card_to_string(hd(hand)))
  end

  def print_hand(hand, hand_size) do
    IO.inspect(card_to_string(hd(hand)))
    print_hand(tl(hand), hand_size - 1)
  end

  def add_random_cards_to_hand(hand, cards_count) when cards_count <= 1 do
    hand = [Uno.generate_random_card | hand]
  end

  def add_random_cards_to_hand(hand, cards_count) do
    hand = [Uno.generate_random_card | hand]
    Uno.add_random_cards_to_hand(hand, cards_count - 1)
  end

  def playable_from_hand?(current_hand, face_up_card) do
    check_hand_cards(current_hand, face_up_card)
  end

  def check_hand_cards([%Uno.Card{} = current_card | leftovers], face_up_card) do
    IO.puts("face-up card: " <> card_to_string(face_up_card) <> " | current: " <> card_to_string(current_card))
    cond do
      current_card.card_type in ["wild", "wild-plus-four"] ->
        true
      current_card.card_type == face_up_card.card_type
        true
      current_card.card_color == face_up_card.card_color
        true
      true ->
        check_hand_cards(leftovers, face_up_card)
    end
  end

  def check_hand_cards([], face_up_card) do
    false
  end
end
