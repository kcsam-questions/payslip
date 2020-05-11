class PayslipsController < ApplicationController
  def generate_monthly_payslip
    if params[:name].nil? || params[:gross_annual_income].nil?
      render json: { error_messages: 'Insufficient Info' }, status: :bad_request
    else
      res = TaxCalculator.generate_monthly_payslip(
        params[:name],
        params[:gross_annual_income]
      )
      render json: res.as_json, status: :ok
    end
  end
end
