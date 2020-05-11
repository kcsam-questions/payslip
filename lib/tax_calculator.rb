require 'singleton'

class TaxCalculator
  include Singleton

  def self.generate_monthly_payslip(name, gross_annual_income)
    {
      "employee_name": nil,
      "gross_monthly_income": nil,
      "monthly_income_tax": nil,
      "net_monthly_income": nil
    }
  end
end
