require 'benchmark'

# Benchmarking of functional-map vs. procedural-for
n = 10_000
arr_length = 1_000
arr = (1..arr_length).map { |i| i }

Benchmark.bmbm do |bench|
  bench.report('map') do
    n.times do
      res = arr.map { |i| i*2 }
    end
  end

  bench.report('for') do
    n.times do
      res = []
      for i in (0..arr_length-1) do
        res[i] = arr[i]*2
      end
    end
  end
end
