class Facebook < Network
  def self.name
    "facebook"
  end

  def self.url
    "https://takehome.io/facebook"
  end

  def self.fields
    ["name", "status"]
  end
end
