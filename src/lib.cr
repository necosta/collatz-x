module Math
  def getA(array, iter)
    array.last(array.size - iter + 1).sum
  end

  def getB(array, iter)
    array[iter - 1]
  end

  def getC(array, iter)
    array.last(array.size - iter).sum
  end

  def getD(array1, array2, iter)
    array2[iter - 1] + array1.last(array1.size - iter).sum
  end

  def getSum(array)
    array.sum
  end
end
