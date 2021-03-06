Rails.application.routes.draw do
# admin側のルーティング
devise_for :admins, controllers: {
	sessions:      'admins/sessions',
	passwords:     'admins/passwords',
	registrations: 'admins/registrations'
}

namespace :admin do
	root 'home#top'
	resources :members, only: [:index,:show,:edit,:update]
	resources :products, only: [:index,:new,:create,:show,:edit,:update]
	resources :genres, only: [:index,:create,:edit,:update]
	resources :orders, only: [:index,:show,:update]
	patch 'order_items/:id' => 'orders#item_update'
	put 'order_items/:id' => 'orders#item_update'
end

# member側のルーティング
root 'home#top'
devise_for :members, controllers: {
	sessions:      'members/sessions',
	passwords:     'members/passwords',
	registrations: 'members/registrations'
}

resource :member, only: [:edit,:show,:update] do
	get 'cancel' => 'member#cancel'
	patch 'withdraw' => 'member#withdraw'
	put 'withdraw' => 'member#withdraw'

	resources :products, only: [:index,:show]

	resources :cart_items, only: [:index,:create,:update,:destroy]
	delete 'cart_items/destroy_all' => 'cart_items#destroy_all'

	resources :orders, only: [:new,:create,:index,:show]
	get 'orders/:id/confirm',to: 'orders#confirm_show',as: 'orders_confirm_show'
	post 'orders/:id/confirm' => 'orders#confirm'
	get 'orders/thanks' => 'orders#thanks'

	resources :shipping_addresses, only: [:index,:edit,:create,:update,:destroy]

end





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
