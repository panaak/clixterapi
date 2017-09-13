Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      post 'klik', to: 'kliks#klik'
      get 'leaderboard', to: 'kliks#leaderboard'
    end
  end
end
