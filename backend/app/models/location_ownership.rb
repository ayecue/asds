class LocationOwnership < ActiveRecord::Base
  belongs_to :location
  belongs_to :user

  before_create do |record|
    Transaktion.create!(:amount=>-location.price, :action=>Transaktion::ACTION_LOCATION_TAKE_OWNERSHIP,:wallet=>user.wallet, :transaktionable=>location)
  end

  def as_json(options = {})
    super(options.merge({:include=>[:user]}))
  end
end
