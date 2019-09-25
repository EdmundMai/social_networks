class Instagram < Network
  def self.name
    "instagram"
  end

  def self.url
    "https://takehome.io/instagram"
  end

  def self.fields
    ["username", "picture"]
  end
end
