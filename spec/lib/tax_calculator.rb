require 'spec_helper'
require 'tax_calculator'

RSpec.describe TaxCalculator do
  describe 'generate_monthly_payslip' do
    let(:calculator1) { TaxCalculator.generate_monthly_payslip('a', 60_000) }
    let(:expected_response1) do
      {
        "employee_name": 'a',
        "gross_monthly_income": '$5000.00',
        "monthly_income_tax": '$500.00',
        "net_monthly_income": '$4500.00'
      }
    end

    let(:calculator2) { TaxCalculator.generate_monthly_payslip('b', 200_000) }
    let(:expected_response2) do
      {
        "employee_name": 'b',
        "gross_monthly_income": '$16666.67',
        "monthly_income_tax": '$4000.00',
        "net_monthly_income": '$12666.67'
      }
    end

    let(:calculator3) { TaxCalculator.generate_monthly_payslip('c', 80_150) }
    let(:expected_response3) do
      {
        "employee_name": 'c',
        "gross_monthly_income": '$6679.17',
        "monthly_income_tax": '$837.08',
        "net_monthly_income": '$5842.09'
      }
    end


    it 'return the correct name and monthly payslip details' do
      expect(calculator1).to eq expected_response1
      expect(calculator2).to eq expected_response2
      expect(calculator3).to eq expected_response3
    end
  end
end
