
# this is now a global variable in our application
$redis = Redis::Namespace.new(:ns, :redis => Redis.new)