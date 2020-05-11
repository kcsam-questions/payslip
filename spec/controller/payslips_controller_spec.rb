require_relative '../rails_helper'

RSpec.describe PayslipsController, type: :controller do
  describe 'GET #generate_monthly_payslip' do
    let(:name)   { 'Alice' }
    let(:params) do
      {
        name: name,
        gross_annual_income: 60_000
      }
    end
    let(:expected_response) do
      {
        'employee_name': name,
        'gross_monthly_income': '$5000.00',
        'monthly_income_tax': '$500.00',
        'net_monthly_income': '$4500.00'
      }
    end

    before do
      get :generate_monthly_payslip, params: params
    end

    it 'returns 200' do
      expect(response.response_code).to eq 200
    end

    it 'returns the monthly payslips' do
      expect(response).to eq expected_response
    end
  end
end
