require "sqlite3"

class DropTables
  def initialize
    @db = SQLite3::Database.new "microblog.db"
  end

  def drop_all
    @db.execute("DROP TABLE IF EXISTS Tags;")
    @db.execute("DROP TABLE IF EXISTS Post;")
    @db.execute("DROP TABLE IF EXISTS Posts;")
  end
end

DropTables.new.drop_all