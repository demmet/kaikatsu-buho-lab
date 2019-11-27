
# defmodule Card do
#   defstruct card_type: ,
# end

defmodule Uno do
  def card_type(number) do
    case number do
      1 ->
        'one'
      2 ->
        'two'
      3 ->
        'three'
      4 ->
        'four'
      5 ->
        'five'
      6 ->
        'six'
      7 ->
        'seven'
    end
  end

  def card_color(number) do
    case number do
      1 ->
        'red'
      2 ->
        'yellow'
      3 ->
        'green'
      4 ->
        'blue'
    end
  end

  def generate_random_card do
    # card_type[:rand.uniform(14)] <> " " <> card_color[:rand.uniform(4)]
  end
end
