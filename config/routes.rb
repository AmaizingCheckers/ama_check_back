Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      resources :classrooms, only: [:index, :show] do
      end

      resources :subjects, only: [:index, :show] do
      end

      resources :histories, only: [:show] do
        collection do
          get :refine_by_teacher
          post :attendance_image_upload
        end
      end

      resources :history_students, only: [:create] do
        collection do
          get :attendance_result
          get :attendance_history_result
        end
      end

      resources :teachers, only: [:index] do
        collection do
          get :search_teacher
        end
      end

      resources :subject_students, only: [:index, :show, :create, :destroy] do
        collection do
          get :find_by_subject
        end
      end

      resources :students, only: [:index, :show, :create, :update] do
      end

      resources :student_images, only: [:index, :show, :create, :destroy] do
      end
    end
  end
end
