class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @caloris = calories
  end
  def healthy?
    (@calories < 200) ? true : false
  end
  def delicious?
    true if self
  end
end

class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(flavor)
    super("#{flavor} Jelly bean", 5)
    @flavor = flavor
    !delicious? if @flavor == 'licorice'
  end
end
