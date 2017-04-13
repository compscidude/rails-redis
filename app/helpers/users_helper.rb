module UsersHelper

# $redis.hmset('user:007', :name, 'Antonio', :busy, 'maybe', :ping, 'pong')
# 
# IN
# $redis.set 'data', hash.to_json

# OUT
# data = JSON.parse($redis.get("data"))


# create 2 redis tables
# 1) Hash table storing :id, :name
# 2) Sorted set storing :name, :score

    # Class variable to hold the current order
    @@order = "desc"

    def fetch_users
        # if "users" redis variable is not initialized yet.
        # 
        users = $redis.exists("users")
        unless users
            users = User.all
            users.each do |user|
                $redis.zadd("users", user.score, user.name)
            end 
        end
    
        @Users = (@@order == "desc" ? $redis.zrevrange("users", 0, -1, :with_scores => true) : $redis.zrange("users", 0, -1, :with_scores => true))
    end 

    def add_to_redis(user)
        $redis.zadd("users", user.score, user.name)
    end 

    def remove_from_redis(user)
        $redis.zrem("users", user.name)
    end 

    def redis_toggle
        if (@@order == "desc")
            @@order = "asc"
        else
            @@order = "desc"
        end
    end 
    
    def clear_redis(name)
        $redis.del name
    end


end
