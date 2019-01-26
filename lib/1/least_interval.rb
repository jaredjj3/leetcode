require_relative "../data_structures/data_structures.rb"

# SESSION
# 1

# PROMPT
=begin
Given a char array representing tasks CPU need to do. It contains capital letters A to Z where different letters represent different tasks. Tasks could be done without original order. Each task could be done in one interval. For each interval, CPU could finish one task or just be idle.

However, there is a non-negative cooling interval n that means between two same tasks, there must be at least n intervals that CPU are doing different tasks or just be idle.

You need to return the least number of intervals the CPU will take to finish all the given tasks.

 

Example:

Input: tasks = ["A","A","A","B","B","B"], n = 2
Output: 8
Explanation: A -> B -> idle -> A -> B -> idle -> A -> B.
 

Note:

The number of tasks is in the range [1, 10000].
The integer n is in the range [0, 100].
=end

def least_interval(tasks, n)
  return tasks.size if n == 0

  map = task_map(tasks)
  count = 0
  
  until map.empty?
    size = map.size
    count += size
    map.each { |task, _count| map[task] -= 1 }
    map.reject! { |_task, count| count == 0 }

    count += [size - 1 + n, 0].max if size <= n && map.any?
  end
  
  count
end

def task_map(tasks)
  tasks.each.with_object(Hash.new(0)) { |task, hash| hash[task] += 1 }
end
