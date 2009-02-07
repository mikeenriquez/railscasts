ActionController::Routing::Routes.draw do |map|
  map.with_options :controller => 'info' do |info|
    info.about 'about', :action => 'about'
    info.contest 'contest', :action => 'contest'
    info.feeds 'feeds', :action => 'feeds'
  end
  
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  
  map.resources :sponsors
  map.resources :comments
  map.resources :tags
  
  map.connect 'episodes/:id', :controller => 'episodes', :action => 'redirect', :id => /\d+/
  map.resources :episodes, :collection => { :archive => :get }
  map.resources :sessions
  
  map.root :episodes
end
