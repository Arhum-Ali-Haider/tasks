Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tasks#index'
  get 'convert_base64_to_image', to:'tasks#convert_base64_to_image'
  get 'manipulate_array_and_convert_to_hash', to:'tasks#manipulate_array_and_convert_to_hash'
end
