require 'json'

def save_data(file_name, data)
  File.write(file_name, JSON.pretty_generate(data))
end

def load_data(file_name)
  if File.exist?(file_name)
    JSON.parse(File.read(file_name))
  else
    []
  end
end
