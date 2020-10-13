require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class StudentTest < Minitest::Test

  def test_it_exists
    student = Student.new('Penelope')
    assert_instance_of Student, student
  end

  def test_student_has_a_name
    student = Student.new('Penelope')
    assert_equal "Penelope", student.name
  end

end
