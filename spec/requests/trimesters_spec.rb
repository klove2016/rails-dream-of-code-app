require 'rails_helper'

RSpec.describe "Trimesters", type: :request do
  describe "GET /trimesters" do
    context 'trimesters exist' do
      before do
        (1..2).each do |i|
          Trimester.create!(
            term: "Term #{i}",
            year: '2025',
            start_date: '2025-01-01',
            end_date: '2025-01-01',
            application_deadline: '2025-01-01',
          )
        end
      end

      it 'returns a page containing names of all trimesters' do
        get '/trimesters'
        expect(response.body).to include('Term 1 2025')
        expect(response.body).to include('Term 2 2025')
      end
      pending "responds with 200 OK"
      it "responds with 200 OK" do
        get "/students"
        expect(response).to have_http_status(:ok)
      end
      pending "renders a page title that includes 'Trimesters'"
      pending "lists each trimester term and year on the page"
      pending "includes a link to each student's show page"
      pending "orders students by year in ascending order (oldest to newest)"
    end
  end
  
  describe "GET /trimesters/:id" do
    before do
      (1..2).each do |i|
        Trimester.create!(
          term: "Term #{i}",
          year: '2025',
          start_date: '2025-01-01',
          end_date: '2025-01-01',
          application_deadline: '2025-01-01',
        )
      end
    end
    pending "responds with 200 OK for an existing student"
    pending "renders the selected trimesters year, term, application deadline, start date and end date"
    pending "includes a Back to Trimesters link"
  end
end
