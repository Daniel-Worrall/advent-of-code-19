module AdventOfCode
  extend self
  def mass_of_fuel(amount)
    amount // 3 - 2
  end

  def run_1_1
    File.read("#{__DIR__}/input/1.txt").each_line.map{ |mass| AdventOfCode.mass_of_fuel(mass.to_i) }.sum
  end
end
