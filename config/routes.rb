Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/departments', to: 'departments#index'

get '/employees/:id', to: 'employees#show'
get '/employees/:employee_id', to: 'employee_tickets#create'

get '/tickets', to: 'tickets#index'
end
