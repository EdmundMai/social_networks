Rails.application.routes.draw do
  root to: 'social_networks#index', :defaults => { :format => :json }
end
