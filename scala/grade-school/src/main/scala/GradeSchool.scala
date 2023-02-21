import collection.mutable.Map

class School {

  type DB = Map[Int, Seq[String]]
  
  var db: DB = Map()

  def add(name: String, g: Int) = {
    db.update(g, (grade(g) :+ name))
  }

  def grade(g: Int): Seq[String] = {
    db.getOrElse(g,Seq.empty)
  }

  def sorted: DB = {
    // Sort db in place.
    for (g <- db.keys) db.update(g, grade(g).sorted)
    // Return the db.
    db
  }
}
