# require modules here
require 'yaml'
require 'pry'

=begin 
returns a hash
has two keys, 'get_meaning' and 'get_emoticon'
the keys 'get_meaning' and 'get_emoticon' point to inner hashes
the keys inside the 'get_meaning' hash are the Japanese emoticons
the emoticon keys inside the 'get_meaning' hash point to their meanings
the keys inside the 'get_emoticon' hash are the English emoticons
the emoticon keys inside the 'get_emoticon' hash point to their Japanese equivalents
=end
    
  
    
def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = {}
  
  emoticon_hash["get_emoticon"] = {}
  emoticon_hash["get_meaning"] = {}
  
  emoticons.each do |english_word, emoticon_set|
    emoticon_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
    emoticon_hash["get_meaning"][emoticon_set.last] = english_word
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_emoticon"][emoticon]
  
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  
  result
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_meaning"][emoticon]
  
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  
  result
end