require 'pry'
require "yaml"
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
      value[:japanese]
    end}
  retval
end

def get_english_meaning(path, emoticon)
  library = load_library path
  retval = library.select {|key, value|  
    if value[:japanese] == emoticon
      key
    end
    retval
    
  #binding.pry
  }

  # code goes here
end