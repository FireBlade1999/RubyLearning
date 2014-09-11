
# using arrays, making a hashmap module called 'Dict' just to show an example
# The Dict is nothing more than a bucket of arrays, which are an array of slots
# which have key-value pairs (tuple) in them.

# general Dict algorithm: 1) convert a key to an int using a hashing function: hash_key
# 2) convert this hash to a bucket number using a % operator, 3) get this bucket from the
# aMap array of buckets, and then traverse it to find the slot that contains the key we want.

module Dict
  
  # initialize a Dict with the given number of buckets
  # put (num_buckets) arrays inside an array (aDict)
  def Dict.new(num_buckets=256)
    aDict = []
    (0...num_buckets).each do |i|
      aDict.push([])
    end
    return aDict
  end
  
  # Given a key this will create a number and then convert it to
  # an index for the aDict's buckets
  # This is the core to a HashMap. Once Ruby's hash method converts
  # a string to a number (key), the % operator and length method are 
  # used to get a bucket where this key can go. The % will divide any 
  # number and give the remainder.
  def Dict.hash_key(aDict, key)
    return key.hash % aDict.length
  end
  
  # given a key, find the bucket
  # this uses the hash_key method to find the bucket I 'could'
  # be in. Since we did % length, then we know whatever bucket_id
  # we get will fit into the aDict array. Using the bucket_id we can
  # then get the bucket where the key 'could' be.
  def Dict.get_bucket(aDict, key)
    bucket_id = Dict.hash_key(aDict, key)
    return aDict[bucket_id]
  end
  
  # returns the index, key and value of a slot found in a bucket
  # This uses get_bucket method to get the bucket a key could be in,
  # and then simply rolls through every element of that bucket until 
  # it finds a matching key. Once it does, it returns a tuple of (i, k, v)
  # which is the index the key was found in, the key itself, and the value
  # set for that key. ie it takes keys, hashes and %'s them to find a bucket,
  # then searches that bucket to find the item. This cuts the search operation
  def Dict.get_slot(aDict, key, default=nil)
    bucket = Dict.get_bucket(aDict, key)
    bucket.each_with_index do |kv, i|
      k, v = kv
      if key == k
        return i, k, v
      end
    end
    return -1, key, default
  end
  
  # gets the value in a bucket for the given key, or the default
  # a convenience function that does what most people what a hashmap
  # to do. It uses get_slot to get the (i, k, v) and then just returns
  # the value (v). 
  def Dict.get(aDict, key, default=nil)
    i, k, v = Dict.get_slot(aDict, key, default = default)
    return v
  end
  
  # sets the key to the value, replacing any existing value
  # to set a key value pair all I need to do is get the bucket
  # and append the new (key, value) to it so it can be found later.
  # However I want my Dict to only allow one key at a time. To do that
  # first I have to find the bucket then check if this key already exists.
  # if it does then I replace it in the bucket with the new one, and it it
  # doesn't then I append. This is actually slower than simply appending, but
  # more likely what a user wants a Dict to do. If you wanted Dict to allow
  # multiple values for a key you could simply have 'get' got through every
  # slot in the bucket and return an array of everything you found. This is
  # a good example of tradeoffs in design, the current version is faster on 
  # 'get', but slower on 'set'
  def Dict.set(aDict, key, value)
    bucket = Dict.get_bucket(aDict, key)
    i, k, v = Dict.get_slot(aDict, key)
    
    if i>=0
      bucket[i] = [key, value]
    else
      bucket.push([key, value])
    end
  end
  
  # deletes the given key from the Dict
  # get the bucket and search for the key in it, delete it from 
  # the array. However, because I chose to make 'set' only store
  # one key/value pair I can stop when I have found one.
  # If I had decided to allow multiple values for each key by simply
  # appending it I would have made 'delete' slower because I would
  # have needed to go through every slot on delete just in case it had
  # a key/value tuple that matched.
  def Dict.delete(aDict, key)
    bucket = Dict.get_bucket(aDict, key)
    
    (0...bucket.length).each do |i|
      k, v = bucket[i]
      if key == k
        bucket.delete_at(i)
        break;
      end
    end
  end
  
  # prints out what's in the Dict
  def Dict.list(aDict)
    aDict.each do |bucket|
      if bucket
        bucket.each {|k, v| puts k, v}
      end
    end
  end
end