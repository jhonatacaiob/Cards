defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "Create_deck makes 20 cards" do
    assert length(Cards.create_deck) == 20
  end

  test "Create hand equal hand_size" do
    hand_size = 3
    {hand, _deck} = Cards.create_hand(hand_size)
    assert length(hand) == hand_size
  end


  test "shuffling a deck ramdomizes it" do
    deck = Cards.create_deck()
    refute deck == Cards.shuffle(deck)
  end
end
