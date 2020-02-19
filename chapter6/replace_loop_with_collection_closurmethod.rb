def managers_arr
  employees.select{ |e| e.manager? }
end

def offices_arr
  employees.collect{ |e| e.offiece }
end

def manager_offices_arr
  employees.select{ |e| e.manager? }.collect{ |e| e.offiece }
end

def total_salary
  employees.inject(0){ |sum, e| sum + e.salary }
end
