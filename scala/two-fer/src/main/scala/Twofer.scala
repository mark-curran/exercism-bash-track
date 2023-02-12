object Twofer {
  def twofer(name: String): String = {

    return s"One for ${if (name.length() == 0) "you" else name}, one for me."

  }
}
