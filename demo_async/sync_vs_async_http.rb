require 'net/http'

def sync_call(urls)
  urls.each do |url|
    url['content'] = Net::HTTP.get( URI.parse(url['link']) )
  end
end

def async_call(urls)
  threads = urls.map do |url|
    Thread.new do
      url['content'] = Net::HTTP.get( URI.parse(url['link']) )
    end
  end

  threads.each(&:join)
end

def http_get_time(method)
  urls = [
    {'link' => 'http://www.google.com/'},
    {'link' => 'http://www.facebook.com/'},
    {'link' => 'http://www.yahoo.com/'},
    {'link' => 'http://www.microsoft.com/'},
    {'link' => 'http://www.rubygems.org/'},
    {'link' => 'http://www.nthu.edu.tw/'},
    {'link' => 'https://github.com/'},
    {'link' => 'https://stackoverflow.com/'},
    {'link' => 'https://amazon.com/'},
    {'link' => 'http://canvas.instructure.com/'}
  ]

  t1 = Time.now

  case method
  when :sync
    sync_call(urls)
  when :async
    async_call(urls)
  else
    raise(ArgumentError, "method argument expected to be either :sync or :async")
  end

  t2 = Time.now
  t2 - t1
end

def run_timer_loop(iterations, method)
  (1..iterations).map { |i| print "#{i} "; http_get_time(method)}
end

def average(times)
  times.reduce(0) { |sum, delta| sum + delta } / times.count
end

N = 10

average( run_timer_loop(N, :sync) )
# => 1 2 3 4 5 6 7 8 9 10 => 6.4932305

average( run_timer_loop(N, :async) )
# => 1 2 3 4 5 6 7 8 9 10 => 1.5270557
