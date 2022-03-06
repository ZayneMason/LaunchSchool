require 'minitest/autorun'

require_relative '../classes/text.rb'

class TextTest < MiniTest::Test
  def setup
    @file = File.open('exercises/testing/tests/sample_text.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    expected_result = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal(expected_result, text.swap('a', 'e'))
  end

  def teardown
    @file.close
  end
end

