defmodule Cards do
  @moduledoc """
    Provides methods for creating and hangling a deck of cards
  """


  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]


    for suit <- suits, value <- values do

      "#{value} of #{suit}"

    end
  end

  @doc """
    Represents shuffling a deck, return a list of strings
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end


  @doc """
    Check if 'card' argument is in a 'deck', return a boolean value
  ### Example
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Two of Spades")
      true
      iex> Cards.contains?(deck, "Six of Spades")
      false
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and a reminder of the deck.
    The 'hand_size' argument indicates how many cards should be in the hand

  ## Examples
      iex> deck = Cards.create_deck
      iex>{hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Save a deck in a file.
    'filename' argument represent the path of a file
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end


  @doc """
    Load a file and return a list of a strings with the "cards"
    Returns a error message if the file does not exists

  ###Example
      iex> Cards.load("FileNotExists")
      "That file does not exists"

  """
  def load(filename) do

    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _resumo} -> "That file does not exists"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
