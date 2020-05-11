require_relative '../rails_helper'

RSpec.describe PayslipsController, type: :controller do
  describe 'GET #generate_monthly_payslip' do
    before do
      get :generate_monthly_payslip, params: params
    end

    context 'when params are provided' do
      let(:employee_name) { 'Alice' }
      let(:params) do
        {
          employee_name: employee_name,
          annual_income: 60_000
        }
      end
      let(:expected_response) do
        {
          'employee_name': employee_name,
          'gross_monthly_income': '$5000.00',
          'monthly_income_tax': '$500.00',
          'net_monthly_income': '$4500.00'
        }.as_json
      end

      it 'returns 200' do
        expect(response.response_code).to eq 200
      end

      it 'returns the monthly payslips' do
        expect(JSON.parse(response.body)).to eq expected_response
      end
    end

    context 'when params are not provided' do
      let(:params) { nil }

      it 'returns 400' do
        expect(response.response_code).to eq 400
      end

      it 'returns the monthly payslips' do
        expect(JSON.parse(response.body)['error_messages'])
          .to eq I18n.t('bad_request')
      end
    end
  end
end
