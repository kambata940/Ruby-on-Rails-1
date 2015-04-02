ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require_relative 'app.rb'


class TestApp < MiniTest::Test
  def setup
    @db = SQLite3::Database.new "microblog.db"
    @posts = Posts.new
    @post = Post.new("Ivan", "This is Ivan's post.\nHave some #tags , #tag1 , #tag2\n")
  end

  def test_save_post
    @post.save
    assert_equal( @db.execute('SELECT data FROM Posts WHERE id = (SELECT MAX(id) FROM Posts)'),
                 [["This is Ivan's post.\nHave some #tags , #tag1 , #tag2\n"]])
  end

  def test_save_tags
    @db.execute('INSERT INTO Posts (nickname,data,time) VALUES (?,?,?)',
                'name1', '#tag1#tag2', '02.03.2015 22:32')
    id = @db.execute("SELECT MAX(id) FROM Posts")
    Post.new("name1", "#tag1#tag2").save_tags(id)
    assert_equal @db.execute("SELECT tag FROM Tags WHERE (id = (SELECT MAX(id) FROM Tags));"),
                 [["tag2"]]
  end

  def test_
    
  end

  def teardown
    # DropTables.new.drop_all
  end
end
