# spec/models/student_spec.rb
require "rails_helper"

RSpec.describe Student, type: :model do
  let(:student) { 
    Student.create(
      first_name: "KJ",
      last_name: "Loving",
      email: "kj@test.com"
    )
  }
  let(:student2) { 
    Student.create(
      first_name: "AJ",
      last_name: "Suning",
      email: "aj@test.com"
    )
  }
  describe "validations" do
    it 'is invaild without a first name' do
      student.first_name = nil
      expect(student).not_to be_valid
    end
    it 'is vaild with a first name' do
      expect(student).to be_valid
    end
    it 'is invalid without last name' do
      student.last_name = nil
      expect(student).not_to be_valid
    end
    it 'is vaild with a last name' do
      expect(student).to be_valid
    end
    it 'is invalid without email' do
      student.email = nil
      expect(student).not_to be_valid
    end
    it 'is vaild with a email' do
      expect(student).to be_valid
    end
    it 'is invalid when email is not unique' do
      student2.email = student.email
      expect(student2).not_to be_valid
    end
    it 'is valid when an email is unique' do
      expect(student2).to be_valid
    end
  end

  describe "#full_name" do
    it "returns 'First Last' for given first_name and last_name" do
      expect(student.full_name).to eq("KJ Loving")
    end
  end

  describe "#initials" do
    it "returns the first letter of first_name and last_name (e.g., 'JS')" do 
      expect(student.initials).to eq("KL")
    end
  
    it "returns both initials in uppercase regardless of input case" do
      student.first_name = "kj"
      expect(student.initials).to eq("KL")
    end
  end

  describe "#name_with_email" do
    it "returns 'First Last <email@example.com>' format" do
      expect(student.name_with_email).to eq("KJ Loving kj@test.com")
    end
  end

  describe "#email_username" do
    it "returns the part of the email before the '@'" do
      expect(student.email_username).to eq("kj")
    end
  end

  describe "#reverse_full_name" do
    it "returns 'Last, First' format" do
      expect(student.reverse_full_name).to eq("Loving, KJ")
    end
  end

  describe "#shout_name" do
    it "returns the full_name in all caps" do
      expect(student.shout_name).to eq("KJ LOVING")
    end
  end
end
