class Twitter < Network
  def self.name
    "twitter"
  end

  def self.url
    "https://takehome.io/twitter"
  end

  def self.fields
    ["username", "tweet"]
  end
end
