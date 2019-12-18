require "./advent-of-code-19"
require "benchmark"

Benchmark.bm do |x|
  {% for method, _index in AdventOfCode.methods.map(&.name.stringify).select { |name| name =~ /run_(\d+_\d)/ } %}
    x.report({{method.stringify}}) do
      AdventOfCode.{{method.id}}
    end
  {% end %}
end
