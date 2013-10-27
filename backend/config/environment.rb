# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Stationary::Application.initialize!

RGeo::ActiveRecord::GeometryMixin.set_json_generator(:geojson)