require File.expand_path('../object', __FILE__)

class Hash
  
  def assert_valid_keys(*valid_keys)
    unknown_keys = keys - [valid_keys].flatten
  end
  
  def to_param(namespace = nil)
    collect do |key, value|
      value.to_query(namespace ? "#{namespace}[#{key}]" : key)
    end.sort * '&'
  end
  
end