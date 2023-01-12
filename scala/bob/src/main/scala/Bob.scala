object Bob {
  def response(statement: String): String = {
    
    val is_question: Boolean = statement.takeRight(1) == "?"
    val is_uppercase: Boolean = statement == statement.toUpperCase()

    if (is_question) { 
      "Sure."
    } else if (is_uppercase) {
      "Whoa, chill out!"
    } else {
      "Whatever."
    }

  }
}