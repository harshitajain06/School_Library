require 'json'

def save_data(filename, data)
  File.write(filename, JSON.pretty_generate(data))
end

def load_data(filename)
  if File.exist?(filename)
    JSON.parse(File.read(filename))
  else
    []
  end
end
