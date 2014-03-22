arr = [2, 3, 7, 14, 30, 57, 120, 251]

def array_sum(arr)
	arr.reduce (:+)
end

arr.each.with_index do |a, i|
	unless i==0
		if (a < array_sum(arr[0..i-1])) then puts "problem at #{i}" end
	end
end
