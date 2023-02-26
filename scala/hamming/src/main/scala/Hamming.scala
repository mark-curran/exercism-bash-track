object Hamming {
  def distance(dnaStrandOne: String, dnaStrandTwo: String): Option[Int] = {
    var distance: Int = 0

    if (dnaStrandOne.length() != dnaStrandTwo.length()) {
      return None
    }

    for (i <- 0 until dnaStrandOne.length()) {
      if (dnaStrandOne(i) != dnaStrandTwo(i)) (distance = distance + 1)
    }
    
    Option(distance)

  }
}
