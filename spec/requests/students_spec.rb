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
    #write a test verifying that the index page is loading correctly
    
    #write a test verifying that the show page is loading correctly

end
end
