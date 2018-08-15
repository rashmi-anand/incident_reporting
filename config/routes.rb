Rails.application.routes.draw do
  resources :incident_proofs
  resources :incidents
  root 'incidents#quick_report'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
