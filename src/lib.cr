module Math
  def calcEq(sum : Float, exp3, exp2)
    sum / (1.0 * 3**exp3 / 2**exp2 - 1.0)
  end

  def calcMemberEq(a, b, c, d)
    1.0 * ((2**b * 3**c) - 3**a) / 2**d
  end

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
