require 'nokogiri'
require 'open-uri'

module Scraper
  URL = "https://books.toscrape.com/"
  @genres = []


  def self.extract_genres(doc)
    genres_links = []
    genres_titles = []
    # genres = []

    doc.css('ul.nav.nav-list > li > ul > li > a').map do |genre|
      # puts genre['href']
      genres_links.push genre['href']
      genres_titles.push genre.text.strip
      @genres.push({link: "https://books.toscrape.com/#{genre['href']}", title: genre.text.strip})
    end
    # puts genres[0]["link"]
    puts genres_titles
  end

  def self.scrape_data
    # puts "Scraping data..."
    unparsed_page = URI.open(URL)
    doc = Nokogiri::HTML(unparsed_page)
    extract_genres(doc)
  end

  def self.get_books_by_genre(genre)
    #iterate over the array of genre objects, and if the tile matches, set a url to the href
    #then scrapre the url for the list of book titles at that genre page
    # genre_url = ""
    # @genres.each do |obj|
    #   if obj[:title].downcase == genre.downcase.strip
    #     genre_url = obj[:link]
    #     # puts genre_url
    #   end
    # end
    genre_obj = @genres.find { |obj| obj[:title] == genre.strip }
    
    # puts genre_obj
    genre_url = genre_obj[:link]

    unparsed_page = URI.open(genre_url)
    doc = Nokogiri::HTML(unparsed_page)
    list_titles(doc)
  end

  def self.list_titles(page)
    page.css('article.product_pod').map do |book|
      puts book.css('h3 > a[title]')[0]['title']
    end
  end
end