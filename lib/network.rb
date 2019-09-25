class Network
  def self.name
    raise "Must implement"
  end

  def self.url
    raise "Must implement"
  end

  def self.fields
    []
  end
end
