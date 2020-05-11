require 'singleton'

class TaxCalculator
  include Singleton

  TAX_RATE = [
    # Format of the array:
    # [bottom_limit, upper_limit, tax_rate]
    [0, 20_000, 0],
    [20_001, 40_000, 10],
    [40_001, 80_000, 20],
    [80_001, 180_000, 30],
    [180_001, Float::INFINITY, 40]
  ].freeze

  CURRENCY_SYMBOL = '$'.freeze

  class << self
    attr_accessor :gross_annual_income

    def generate_monthly_payslip(name, gross_annual_income)
      @gross_annual_income = gross_annual_income.to_f
      {
        "employee_name": name,
        "gross_monthly_income": number_to_currency(gross_monthly_income),
        "monthly_income_tax": number_to_currency(monthly_income_tax),
        "net_monthly_income": number_to_currency(net_monthly_income)
      }
    end

    private

    def gross_monthly_income
      (@gross_annual_income / 12).round(2)
    end

    def annual_income_tax
      annual_income_tax = 0

      TAX_RATE.each do |tax_info|
        bottom_limit, upper_limit, tax_rate = tax_info
        if @gross_annual_income <= upper_limit
          range = @gross_annual_income - bottom_limit + 1
          annual_income_tax += range * tax_rate / 100
          break
        end

        annual_income_tax += (upper_limit - bottom_limit + 1) * tax_rate / 100
      end

      annual_income_tax
    end

    def monthly_income_tax
      (annual_income_tax / 12).round(2)
    end

    def net_monthly_income
      gross_monthly_income - monthly_income_tax
    end

    def number_to_currency(num)
      CURRENCY_SYMBOL + format('%.2f', num)
    end
  end
end
