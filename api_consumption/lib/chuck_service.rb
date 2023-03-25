require 'faraday'
require 'json'
require 'pry'

class ChuckService

  def self.random
    response = get_url('/jokes/random')
    parsed(response)
  end

  def self.random_in_category(category) 
    response = get_url("jokes/random?category=#{category}")
    parsed(response)
  end

  def self.categories 
    response = get_url("/jokes/categories")
    parsed(response)
  end

  def self.search(searched_term)
    response = get_url("/jokes/search?query=#{searched_term}")
    parsed(response)
  end

  def self.conn 
    Faraday.new("https://api.chucknorris.io")
  end

  def self.get_url(url)
    conn.get(url)
  end

  def self.parsed(response) 
    JSON.parse(response.body)
  end
end