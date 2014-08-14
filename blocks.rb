def eval_block(*args, &prc)
  if prc.nil?
    p "NO BLOCK GIVEN!"
  else
    prc.call(*args)
  end
end

class Array
  def my_each(&prc)
    for i in 0...self.length
      prc.call(self[i])
    end
    self
  end

  def my_map(&prc)
    result = []
    self.my_each { |el| result << prc.call(el) }
    result
  end

  def my_select(&prc)
    result = []
    self.my_each { |el| result << el if prc.call(el)}
    result
  end

  def my_inject (&prc)
    memo=self[0]
    self.drop(1).my_each do|el|
      memo = prc.call(memo,el)
    end
  end

  def my_sort!(&prc)
    while true
      sorted =  true
      (0...self.length-1).each do |index|
        a = self[index]
        b = self[index + 1]
        if (prc.call(a, b)) == 1
          self[index], self[index + 1] = b, a
          sorted = false
        end
      end
      break if sorted
    end
    self
  end

  def my_sort(&prc)
    self.dup.my_sort!(&prc)
  end
end
