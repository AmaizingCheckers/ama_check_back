Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :classrooms, only: [:index, :show] do
      end

      resources :subjects, only: [:index, :show] do
      end

      resources :histories, only: [] do
        collection do
          post :attendance_image_upload
        end
      end

      resources :history_students, only: [] do
        collection do
          get :attendance_result
        end
      end
    end
  end
end
