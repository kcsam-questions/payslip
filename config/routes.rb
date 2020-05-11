Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/payslips/generate_monthly_payslip', to: 'payslips#generate_monthly_payslip'
end
