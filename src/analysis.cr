module Analysis
  extend self

  def getSumMember(a, b, c, d)
    num = (BigInt.new(2)**b * BigInt.new(3)**c) - BigInt.new(3)**a
    dem = BigFloat.new(2)**d
    num / dem
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
end
