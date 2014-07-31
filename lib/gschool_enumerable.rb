module GschoolEnumerable

  def g_each #(&block)

    for item in self
      #block.call(item)
      yield(item)
    end

    self
  end

  def g_select
    arr =[]
    self.g_each {|item| arr << item if yield(item)}
    arr
  end

  def g_reject
    arr = []
    self.g_each {|item| arr << item unless yield(item)}
    arr
  end

  def g_map
    arr = []
    self.g_each{|item| arr << yield(item) }
    arr
  end

  def g_find
    arr = []
    self.g_each {|item| arr <<  item if yield(item)}
    arr.first
  end

  def g_select!
    self.g_each { |item| self.delete(item) unless yield(item)}
  end

end
