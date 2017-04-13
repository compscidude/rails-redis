module UsersHelper

    def fetch_users
        users = $redis.get("users")
        # if "users" redis variable is not initialized yet.

        # run through each user and save it in a hash format?

        if users.nil?
            users = User.all.to_json # default scope, sort them in decreasing order
            $redis.set("users", users)
            $redis.expire("users", 3.hours.to_i)
        end
        
        # When storing ata to redis, we have to convert it into json format.
        # Storing to Redis: User.all.to_json
        # Loading from Redis: Json.load users (where users = $redis.get("users"))

        @Users = JSON.load users
    end 

    def refetch_users
        clear_cache("users")
    end 
    
     def clear_cache(name)
        $redis.del name
     end

end
