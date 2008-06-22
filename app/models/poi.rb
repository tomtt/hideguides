require 'hpricot'

class Poi < ActiveRecord::Base
  has_one :wall
  
  def self.find_or_create_by_xml(xml)
    title = (xml/:title).innerHTML
    find_by_title(title) || create_from_xml(xml)
  end
  
  private
  
  def self.create_from_xml(xml)
    fields = {}
    [:title, :latitude, :longtitude, :address, :lonely_planet_id].each do |field|
      fields[field] = (xml/field).innerHTML
    end
    Poi.create(fields)
  end
end
