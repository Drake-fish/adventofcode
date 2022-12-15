require "pry"

class Monkey
  attr_accessor :inspections
  def initialize(**opts)
    @items = opts[:items].split("Starting items: ")[1].split(",")
    @operation = opts[:operation].split("Operation: new = ")[1]
    @test = opts[:test].split("Test: divisible by ")[1].to_i
    @inspections = 0
    @part_2 = opts[:part_2]
    @true_monkey = opts[:true_monkey].split("If true: throw to monkey ")[1].to_i
    @false_monkey = opts[:false_monkey].split("If false: throw to monkey ")[1].to_i
  end

  def inspect_and_throw_items(monkeys)
    while(@items.length > 0)
      @inspections += 1
      item = @items.shift
      throw_to_monkey, worry_level = throw_to_monkey(item)
      monkeys[throw_to_monkey].catch_item(worry_level)
    end
    monkeys
  end

  def throw_to_monkey(item)
    worry_level = calculate_worry_level(item)
    if worry_level % @test == 0
      return @true_monkey, worry_level
    else
      return @false_monkey, worry_level
    end
  end

  def calculate_worry_level(item)
    if @part_2 
     (eval(@operation.gsub("old", item.to_s)).round)
    else 
      eval(@operation.gsub("old", item.to_s)) / 3.round
    end
  end

  def catch_item(item)
    @items << (big item)
  end
end