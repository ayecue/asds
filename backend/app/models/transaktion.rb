class Transaktion < ActiveRecord::Base

  belongs_to :transaktionable, polymorphic: true

  ACTION_LOCATION_TAKE_OWNERSHIP = 'ACTION_LOCATION_TAKE_OWNERSHIP'
  ACTION_EVENT = 'ACTION_EVENT'
  ACTION_WALLET_REFILL = 'ACTION_WALLET_REFILL'
  ACTION_LOCATION_PASSING_PAY = 'ACTION_PAY_LOCATION_PASSING'
  ACTION_LOCATION_PASSING_RECEIVE = 'ACTION_PAY_LOCATION_PASSING'

  after_create do |record|
    wallet.total += amount
    wallet.save!
  end
  belongs_to :wallet
end
