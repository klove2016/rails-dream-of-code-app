require 'rails_helper'

RSpec.describe "Students", type: :request do
    describe "GET /students" do
      let!(:student) { 
        Student.create(
          first_name: "KJ",
          last_name: "Loving",
          email: "kj@test.com"
        )
      }
      let!(:student2) { 
        Student.create(
          first_name: "AJ",
          last_name: "Suning",
          email: "aj@test.com"
        )
      }
      it 'returns a page containing names of all trimesters' do
        get '/students'
        expect(response.body).to include('KJ')
        
      end
      pending "responds with 200 OK"
      pending "renders a page title that includes 'Students'"
      pending "lists each student's full_name on the page"
      pending "shows 'No students' message when there are no students"
      pending "includes a link to each student's show page"
      pending "orders students by last_name ascending"
    end

    describe "GET /students/:id" do
      let!(:student) { 
        Student.create(
          first_name: "KJ",
          last_name: "Loving",
          email: "kj@test.com"
        )
      }
      let!(:student2) { 
        Student.create(
          first_name: "AJ",
          last_name: "Suning",
          email: "aj@test.com"
        )
      }
      pending "responds with 200 OK for an existing student"
      pending "renders the selected student's full_name and email"
      pending "includes a Back to Students link"
      pending "shows the student’s initials somewhere on the page"
    end
end
