require "./factorization"

module Iterator
  extend self

  @@exp3Cached = {} of Int32 => BigInt
  @@exp2Cached = {} of Int32 => BigInt

  # Improve this logic. Should be a constructor but this is not a class
  def init(maxCycles, permutations)
    (0..maxCycles + 6 * permutations).each do |i|
      @@exp3Cached[i] = BigInt.new(3)**i
      @@exp2Cached[i] = BigInt.new(2)**i
    end
  end

  def iterate(maxCycles, permutations)
    counter = 0
    const = Math.log(1.5)
    genFlows(maxCycles).each_repeated_permutation(permutations) do |i|
      x_sum = i.map { |i| i[0] }.sum
      y_sum = i.map { |i| i[1] }.sum
      threshold = Math.log(2**(y_sum - x_sum)) / const
      if (x_sum < threshold)
        counter += 1
        puts i
        output = startEach(i)
        if (output > 0 && Math.isNaturalNumber?(output) && output != 4)
          puts output
          return
        end
      end
    end
    puts "#{counter} positive values"
  end

  private def startEach(input : Array(Array(Int32)))
    x = pivotInput(input, 0)
    y = pivotInput(input, 1)
    z = pivotInput(input, 2)
    w = pivotInput(input, 3)
    calc(x, y, z, w)
  end

  def calc(x, y, z, w)
    num = BigFloat.new(0)
    (1..x.size).each do |it|
      a = getA(x, it)
      b = getB(z, it)
      c = getC(x, it)
      d = getD(y, w, it)
      member = @@exp2Cached[y.sum] * getSumMember(a, b, c, d)
      num += member
    end
    dem = @@exp3Cached[x.sum] - @@exp2Cached[y.sum]
    # Exploratory
    # numF = Math.factorize(num.abs).reject! { |v| v == 2 }.uniq
    # demF = Math.factorize(dem.abs).uniq
    # puts "Num: #{numF} || Dem: #{demF}"
    num / dem
  end

  def pivotInput(input : Array(Array(Int32)), pos)
    out = Array(Int32).new
    input.each do |array|
      out << array[pos]
    end
    out
  end

  def genFlows(maxCycles)
    flows = Array(Array(Int32)).new
    flows << [1, 2, 1, 0]
    flows << [1, 4, 1, 0]
    (0..maxCycles).each do |x|
      flows << [x, x + 6, x, x + 1]
      flows << [x + 1, x + 6, x, x + 1]
      flows << [x + 1, x + 5, x + 1, x + 2]
      flows << [x + 2, x + 5, x + 1, x + 2]
      flows << [x + 1, x + 3, x + 1, x + 2]
      flows << [x + 2, x + 3, x + 1, x + 2]
    end
    flows
  end

  def getSumMember(a, b, c, d)
    num = (@@exp2Cached[b] * @@exp3Cached[c]) - @@exp3Cached[a]
    dem = @@exp2Cached[d]
    BigFloat.new(1) * num / dem
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
