class PayslipsController < ApplicationController
  def generate_monthly_payslip
    if params[:employee_name].nil? || params[:annual_income].nil?
      render json: { error_messages: I18n.t("bad_request")}, status: :bad_request
    else
      res = TaxCalculator.generate_monthly_payslip(
        params[:employee_name],
        params[:annual_income]
      )
      render json: res.as_json, status: :ok
    end
  end
end
