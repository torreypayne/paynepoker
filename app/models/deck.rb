class Deck < ActiveRecord::Base
  attr_accessor :cards, :labels, :ranks, :suits
  
  def initialize
    # shuffle array and init each Card
    ranks = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    suits = %w(Spade Heart Club Diamond)
    labels = ranks.product(suits)
    @cards = kfy_shuffle((0..51).to_a)
    shuffled = Array.new
    @cards.map do |c|
        shuffled.push(labels[c])
    end
    @cards = shuffled
  end
  
  def cards
    @cards
  end
  
  def kfy_shuffle(arr)
    n = arr.length
    for i in 0...n
      r = Random.rand(n-i)+i
      arr[r], arr[i] = arr[i], arr[r]
    end
    return arr
  end
  
  def draw
      @cards.unshift
  end
end
