object Leap {
  def leapYear(year: Int): Boolean = {
    
    val div_by_4: Boolean = (year % 4) == 0
    val div_by_100: Boolean = (year % 100) == 0
    val div_by_400: Boolean = (year % 400) == 0

    if (!div_by_4 || (div_by_100 && !div_by_400)) {
      return false
    }

    return true

  }
}
