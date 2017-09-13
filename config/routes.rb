Rails.application.routes.draw do
  namespace 'api', defaults: { format: :json } do
    namespace 'v1' do
      post 'klik', to: 'kliks#klik'
      get 'leaderboard', to: 'kliks#leaderboard'
    end
  end
end
