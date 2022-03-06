require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

class Testing < MiniTest::Test

  def test_odd
    @value = 1
    assert(@value.odd?)
  end

  def test_downcase
    @value = 'XYZ'
    assert_equal('xyz', @value.downcase)
  end

  def test_nil
    @value = nil
    assert_nil(@value)
  end

  def test_empty
    @value = []
    assert(@value.empty?)
  end

  def test_obj_assertions
    @value = ['xyz']
    assert(@value.include?('xyz'))
  end
  
  def test_raising
    assert_raises(NoExperienceError) { employee.hire }
  end

  def test_type_assertions
    @value = Numeric.new
    assert(@value.class == Numeric)
  end

  def test_kind_type_assertion
    @value = 1
    assert_kind_of(Numeric, @value)
  end

  def test_same_object_assertions
    assert_same(list, list.process)
  end

  def test_refute_array_item
    refute_includes(list, 'xyz')
  end
end
