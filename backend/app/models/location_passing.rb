class LocationPassing < ActiveRecord::Base

  set_rgeo_factory_for_column(:enter_point, RGeo::Geographic.spherical_factory(:srid => 4326))
  set_rgeo_factory_for_column(:exit_point, RGeo::Geographic.spherical_factory(:srid => 4326))

  belongs_to :user
  belongs_to :location

end
