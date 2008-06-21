class CreatePointOfInterests < ActiveRecord::Migration
  # <poi node_id="12783" type="see">
  #   <title>Jewish Museum</title>
  #   <address>Lindenstrasse 9-14</address>
  #   <neighbourhood>Western Kreuzberg</neighbourhood>
  #   <destination_id>12704</destination_id>
  #   <tags>museum,lp,architectural highlight</tags>
  #   <distance>0.455826947097244</distance>
  #   <latitude>52.5023</latitude>
  #   <longitude>13.3954</longitude>
  # </poi>

  def self.up
    create_table :point_of_interests do |t|
      t.string :latitude, :longtitude, :title, :address, :type
      t.integer :lonely_planet_id
      t.timestamps
    end
  end

  def self.down
    drop_table :point_of_interests
  end
end
