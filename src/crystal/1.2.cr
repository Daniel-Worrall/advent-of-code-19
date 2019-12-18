module AdventOfCode
  extend self

  def recursive_mass_of_fuel(amount)
    total = 0
    mass = amount
    while (fuel = mass_of_fuel(mass)) > 0
      total += fuel
      mass = fuel
    end
    total
  end

  def run_1_2
    File.read("#{__DIR__}/input/1.txt").each_line.map { |mass| AdventOfCode.recursive_mass_of_fuel(mass.to_i) }.sum
  end
end
