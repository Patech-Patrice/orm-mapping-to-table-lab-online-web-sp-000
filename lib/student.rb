class Student

attr_accessor :name, :grade

def initialize(name, grade)
  @name = name
  @grade = grade
end



  def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        name TEXT,
        grade INTEGER
        )
        SQL
    DB[:conn].execute(sql)
  end









  def save
  sql = <<-SQL
    INSERT INTO songs (name, album)
    VALUES (?, ?)
  SQL
  DB[:conn].execute(sql, self.name, self.album)
  @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]

end




  def self.create(name:, album:)
      song = Song.new(name, album)
      song.save
      song
    end



end
