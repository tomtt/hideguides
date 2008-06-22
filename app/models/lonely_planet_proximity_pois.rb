require 'hpricot'
require 'open-uri'

class LonelyPlanetProximityPois
  def self.fetch_for_position(longtitude, latitude)
    url = "http://api.lonelyplanet.com/services/get/lps.proximity_pois/xml/9c6e3xwa84nkznduhc87xdcv/%f/%f/*/*/5/eng/100" %
      [longtitude.to_f, latitude.to_f]
    doc = Hpricot.XML(open(url))
    return [] unless doc

    pois = doc/:poi
    pois.map { |poi| Poi.find_or_create_by_xml(poi) }
    
    # book_elements = (doc/:BookData)
    # return book if book_elements.blank?
    # 
    # book_element = book_elements.first
    # book.isbn = book_element["isbn"]
    # book.text_id = book_element["book_id"]
    # book.title = tag_content(book_element/:Title)
    # book.title_long = tag_content(book_element/:TitleLong)
    # book.authors = tag_content(book_element/:AuthorsText)
    # book.publishers = tag_content(book_element/:PublisherText)
    # book.notes = tag_content(book_element/:Notes)
    # book.urls = tag_content(book_element/:UrlsText)
    # book.awards = tag_content(book_element/:AwardsText)
    # 
    # return book
  end

  private

  def self.tag_content(tag)
    return "" if tag.blank?
    tag.first.innerHTML
  end
  
end
