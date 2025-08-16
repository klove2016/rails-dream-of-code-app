class Student < ApplicationRecord
  has_many :enrollments
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
  
  def initials
    "#{first_name[0].upcase}#{last_name[0].upcase}"
  end
  
  def name_with_email
    "#{first_name} #{last_name} #{email}"
  end
  
  def email_username
    x = email.index("@")
    email[0...x]
  end
  
  def reverse_full_name
    "#{last_name}, #{first_name}"
  end
  
  def shout_name
    "#{full_name.upcase}"
  end
end
