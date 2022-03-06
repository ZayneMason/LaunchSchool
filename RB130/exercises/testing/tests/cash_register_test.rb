require_relative '../classes/cash_register.rb'
require_relative '../classes/transaction.rb'
require 'minitest/autorun'

class CashRegisterTest < MiniTest::Test
  def test_accept_money
    transaction = Transaction.new(100)
    register = CashRegister.new(1000)
    transaction.amount_paid = 100

    previous = register.total_money
    register.accept_money(transaction)
    current = register.total_money

    assert_equal(previous + 100, current)    
  end

  def test_change
    transaction = Transaction.new(100)
    register = CashRegister.new(1000)
    transaction.amount_paid = 110
    register.accept_money(transaction)

    assert_equal(transaction.amount_paid - transaction.item_cost, register.change(transaction))
  end

  def test_recipt
    item_cost = 100
    transaction = Transaction.new(item_cost)
    register = CashRegister.new(1000)
    assert_output("You've paid $#{item_cost}.\n") {|_| register.give_receipt(transaction)}
  end

  def test_prompt
    transaction = Transaction.new(1000)
    good_input = StringIO.new("1000\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: good_input, output: output)

    assert_equal(1000, transaction.amount_paid)
  end
end
