# rubocop:disable Style/OptionalBooleanParameter
require './person'

class Student < Person
@@ -6,7 +7,13 @@ def initialize(age, classroom, name = 'Unknown', parent_permission = true)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
# rubocop:enable Style/OptionalBooleanParameter
