def found_friends(people)
  people.select do |person|
    %w(Don John Kent).include? person
  end
end

# railsであれば
def found_friends(people)
  people.select do |person|
    person.in?(%w(Don John Kent))
  end
end
