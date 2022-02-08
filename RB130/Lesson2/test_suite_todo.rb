require 'simplecov'
require 'minitest/autorun'
require "minitest/reporters"

SimpleCov.start
Minitest::Reporters.use!

require_relative 'to_do_list'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end
  
  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todos.first, @list.first)
  end

  def test_last
    assert_equal(@todos.last, @list.last)
  end

  def test_shift
    assert_equal(@todos.shift, @list.shift)
    assert_equal([@todo2, @todo3], @todos)
  end

  def test_pop
    assert_equal(@todos.pop, @list.pop)
    assert_equal([@todo1, @todo2], @todos)
  end

  def test_done?
    assert_equal(false, @list.done?)
    @todos.each {|todo| todo.done!}
    assert_equal(true, @list.done?)
  end

  def test_ass_raise_error
    assert_raises(TypeError) {@list.add('Hi')}
    assert_raises(TypeError) {@list.add(12)}
  end

  def test_shovel
    new_todo = Todo.new('Test')
    @list << new_todo
    assert_equal(new_todo, @list.last)
  end

  def test_add_alias
    new_todo = Todo.new("Feed the cat")
    @list.add(new_todo)
    @todos << new_todo
  
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todos[0], @list.item_at(0))
    assert_raises(IndexError) {@list.item_at(12)}
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @list.item_at(0).done?)
  end

  def test_mark_undone_at
    @list.mark_undone_at(0)
    assert_equal(false, @list.item_at(0).done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @list.select {|todo| todo.done?}.size == @list.size)
  end

  def test_remove_at
    test_item = @list.remove_at(0)
    refute_equal(test_item, @list.item_at(0))
    assert_raises(IndexError) {@list.remove_at(32)}
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    Today's Todos:
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_done
    output = <<~OUTPUT.chomp
    Today's Todos:
    [ ] Buy milk
    [ ] Clean room
    [X] Go to gym
    
    OUTPUT
    @list.mark_done_at(2)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<~OUTPUT.chomp
    Today's Todos:
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    
    OUTPUT
    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    @list.each {|todo| todo.done!}
    assert_equal(true, @list.done?)
  end

  def test_each_return
    assert_equal(@list, @list.each {|todo| 1 + 1})
  end

  def test_select
    assert_equal([@todo1, @todo2, @todo3], @list.select {|todo| true})
  end

end