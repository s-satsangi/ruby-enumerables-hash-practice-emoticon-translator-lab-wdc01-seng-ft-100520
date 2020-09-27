require 'pry'
require "yaml"
$not_found = "Sorry, that emoticon was not found"
# require modules here

def load_library path
  # code goes here
  emoticon_temp = YAML.load_file(path)
  emoticon_library = emoticon_temp.each_with_object({}) do |(key,value),library|
    library[key]={ :english => value[0], :japanese => value[1] }
    
 # binding.pry
  end
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  library = load_library path
  retval = library.select {|key, value|  
    if value[:english] == emoticon
      return value[:japanese]
    end}
  $not_found
end

def get_english_meaning(path, emoticon)
  library = load_library path
  retval = library.select {|key, value|  
    if value[:japanese] == emoticon
      return key
    end
   
    
  #binding.pry
  }
   $not_found
  # code goes here
end