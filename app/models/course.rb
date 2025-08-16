class Course < ApplicationRecord
  belongs_to :coding_class
  belongs_to :trimester
  has_many :enrollments

  delegate :title, to: :coding_class

  # def student_name_list
  #   arr = []
  #   enrollments.each do |e|
  #     arr.push("#{e.student.first_name} #{e.student.last_name}")
  #   end
  #   arr
  # end

  def student_name_list
    enrollments.includes(:student).map { |e| "#{e.student.full_name}" }
  end

  # def student_email_list
  #   arr = []
  #   enrollments.each do |e|
  #     arr.push("#{e.student.email}")
  #   end
  #   arr
  # end

  def student_email_list
    enrollments.includes(:student).pluck('students.email')
  end
  
  def formatted_title
    "Course: #{title}"
  end
  
  def title_upcase
    title.upcase
  end
  
  def title_abbreviation
    title.split(" ").map{ |e| e[0].upcase}.join
  end
  
  def title_length
    title.length
  end
  
  def short_description
    coding_class.description[0..49]
  end
end
