# Getting started with Redis (on app harbor)

redis lets you perform simple operations on a fast in-memory (and persisted) store.

It's basically a key value store, where the keys are strings, and the values can be any of five+ basic types. Links below show you the functions you can apply to each type.

1. [string](http://redis.io/commands/#string). (Can be anything, redis don't care) (if it's an integer, it can be incremented (atomically) tho!)
2. [lists](http://redis.io/commands#list) (queues, you can push and pop... actually you can left pop, right pop, left push, right push!)
3. [sets](http://redis.io/commands#set) (unordered sets) you can add members, union sets
4. [zsets](http://redis.io/commands#sorted_set) (an ordered set) Each member has a score. the set is sorted by the score.
5. [hashes](http://redis.io/commands#hash) (maps between string fields and string values)
6. [Hyperloglog](http://redis.io/commands#hyperloglog) [uhhh....](http://antirez.com/news/75) 
7.  Coming soon.

All types are accessed by keys. Keys are strings.
 
## See also

 * [Getting started with Redis on AppHarbor](https://blog.appharbor.com/2012/04/23/getting-started-with-redis-on-appharbor) (30 meg free)
 * https://try.redis.io/
 * [Karl Seguin's 'little redis book'](http://openmymind.net/2012/1/23/The-Little-Redis-Book/) just 29 glorious pages

