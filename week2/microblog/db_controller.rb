require "sqlite3"

class CreateTables
  
  def initialize
    @db = SQLite3::Database.new "microblog.db"
  end

  def create_posts_table
    @db.execute <<-SQL
    CREATE TABLE Posts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nickname TEXT(40),
        data TEXT(256),
        time TEXT(30)
      );
    SQL
  end

  def create_tags_table
    @db.execute <<-SQL
    CREATE TABLE Tags (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        postId INT,
        tag TEXT(40)
      );
    SQL
  end
end

CreateTables.new.create_tags_table
CreateTables.new.create_posts_table
