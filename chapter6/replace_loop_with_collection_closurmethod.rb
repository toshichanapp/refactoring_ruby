def managers_arr
  managers = []
  employees.each do |e|
    managers << e if e.manager?
  end
  managers
end

def offices_arr
  offieces = []
  employees.each{ |e| offieces << e.office }
  offieces
end

def manager_offices_arr
  manager_offices = []
  employees.each{ |e| manager_offices << e.office if e.manager? }
  manager_offices
end

def total_salary
  total = 0
  employees.each { |e| total += e.salary }
  total
end
