
# this is now a global variable in our application
uri = ENV["REDISTOGO_URL"] || "redis://localhost:6379/"
REDIS = Redis.new(:url => uri)
$redis = Redis::Namespace.new(:ns, :redis => REDIS)
