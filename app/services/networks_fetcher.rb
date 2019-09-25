require 'net/http'
require 'open-uri'
require 'active_support/core_ext/hash/slice'

module NetworksFetcher
  NETWORKS = [
    Twitter,
    Facebook,
    Instagram,
  ]

  def NetworksFetcher.fetch
    threads = []
    payloads = {}
    payloads_mutex = Mutex.new

    NetworksFetcher::NETWORKS.each do |network|
      threads << Thread.new(network, payloads) do |n, results|
        begin
          posts = JSON.parse open(n.url).read
          filtered_by_fields = posts.map { |post| post.slice(*n.fields) }
          payloads_mutex.synchronize { results[n.name] = filtered_by_fields }
        rescue OpenURI::HTTPError
          payloads_mutex.synchronize { results[n.name] = [] }
        end
      end
    end

    threads.each(&:join)
    payloads
  end
end
