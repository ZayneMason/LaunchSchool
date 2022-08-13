require "pg"

class DatabasePersistence
  def initialize(logger)
    @db = if Sinatra::Base.production?
      PG.connect(ENV['DATABASE_URL'])
    else
      PG.connect(dbname: "todos")
    end
    @logger = logger
  end

  def disconnect
    @db.close
  end
  
  def find_list(id)
    sql = <<~SQL
    SELECT lists.*,
      COUNT(todos.id) AS todos_count,
      COUNT(NULLIF(todos.completion_status, true)) AS todos_remaining
      FROM lists
      LEFT JOIN todos ON todos.list_id = lists.id
      WHERE lists.id = $1
      GROUP BY lists.id
      ORDER BY lists.name;
    SQL
    result = query(sql, id)

    tuple_to_list_hash(result.first)
  end

  def all_lists
    sql = <<~SQL
    SELECT lists.*,
      COUNT(todos.id) AS todos_count,
      COUNT(NULLIF(todos.completion_status, true)) AS todos_remaining
      FROM lists
      LEFT JOIN todos ON todos.list_id = lists.id
      GROUP BY lists.id
      ORDER BY lists.name;
    SQL
    result = query(sql)

    result.map do |tuple|
      tuple_to_list_hash(tuple)
    end
  end

  def create_new_list(name)
    sql = "INSERT INTO lists(name) VALUES ($1)"
    query(sql, [name])
  end

  def delete_list(id)
    query("DELETE FROM todos WHERE list_id = $1", id)
    query("DELETE FROM lists WHERE id = $1", id)
  end

  def update_list_name(id, new_name)
    sql = "UPDATE lists SET name = $2 WHERE id = $1"
    query(sql, id, new_name)
  end

  def create_new_todo(list_id, todo_name)
    sql = "INSERT INTO todos(list_id, name) VALUES ($1, $2)"
    query(sql, list_id, todo_name)
  end

  def delete_todo_from_list(list_id, todo_id)
    sql = "DELETE FROM todos WHERE id = $2 AND list_id = $1"
    query(sql, list_id, todo_id)
  end

  def update_todo_status(list_id, todo_id, status)
    sql = "UPDATE todos SET completion_status = $3 WHERE list_id = $1 AND id = $2"
    query(sql, list_id, todo_id, status)
  end

  def mark_all_todos_complete(list_id)
    sql = "UPDATE todos SET completion_status = true WHERE list_id = $1"
    query(sql, list_id)
  end

  def get_todos_for_list(list_id)
    sql = "SELECT * FROM todos WHERE list_id = $1"
    result = query(sql, list_id)
    todos = result.map do |todo_tuple|
      { id: todo_tuple["id"].to_i,
        name: todo_tuple["name"],
        completed: todo_tuple["completion_status"] == "t" }
    end
  end

  private

  def query(statement, *params)
    @logger.info "#{statement}: #{params}"
    @db.exec_params(statement, params)
  end

  def tuple_to_list_hash(tuple)
    { id: tuple["id"].to_i,
      name: tuple["name"],
      todos_count: tuple["todos_count"].to_i,
      todos_remaining: tuple["todos_remaining"].to_i }
  end
end
