class Location < ActiveRecord::Base
  set_rgeo_factory_for_column(:latlong,
                              RGeo::Geographic.spherical_factory(:srid => 4326))

  has_many :location_ownerships

  def location_ownership
    LocationOwnership.where(:location_id=>id).where("'end' > ?", DateTime.now).take
  end
end
