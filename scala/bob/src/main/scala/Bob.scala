object Bob {
  def response(statement: String): String = {

    // Get rid of whitespace.
    val clean_string: String = statement.trim()
    
    // Check the conditions for  the exercise.
    val is_question: Boolean = clean_string.takeRight(1) == "?"
    val is_empty: Boolean = clean_string == ""
    val is_shouting: Boolean = (clean_string.replaceAll("[^a-zA-Z]","").length > 0) && (clean_string.toUpperCase() == clean_string)

    // Empty string.
    if (is_empty) {
      return "Fine. Be that way!"
    }
    // Shouting a question.
    if (is_question && is_shouting) {
      return "Calm down, I know what I'm doing!"
    } 
    // A questing, no shouting.
    if (is_question && !is_shouting) { 
      return "Sure."
    }
    // Not a question, but shouting.
    if (!is_question && is_shouting) {
      return "Whoa, chill out!"
    } 
    
    // Default return value.
    return "Whatever."
  
  }
}