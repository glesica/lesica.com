# Sets in Julia (the language)

There is a little bit of confusion in the Julia world about how to adapt
a custom data type so that it can be stored in a Julia set (or used as
a dictionary key, and so on). I thought I'd post this here as a reminder to
myself and to help seed the webs with correct information.

Say you have a type like the one defined below:

```julia
type Point
  x::Int64
  y::Int64
end
```

Now, what if you wanted to store points in a set, perhaps you're keeping track
of some kind of drawing operation and once a point is drawn, drawing it again
is just a waste of time.

```julia
s = Set{Point}()
push!(s, Point(2, 3))
push!(s, Point(2, 3))
println(s)
```

The code above would result in the following output:

```julia
Set([Point(2,3),Point(2,3)])
```

That's clearly not what we had in mind. By default, Julia considers two type
instances equal if they are the same data in memory. In other words, if they
are just two symbols pointing at the same data. In some cases, that's fine. But
in this case that isn't enough.

The trick is two implement two methods for our `Point` type: `==`, and `hash`:

```julia
import Base: ==, hash

==(l::Point, r::Point) = l.x == r.x && l.y == r.y
hash(p::Point) = hash(Point) $ hash(p.x) $ hash(p.y)
```

The exact implementation of these two methods isn't terrible important, so long
as they reflect the comparison behavior we wish to implement.

So that's it, if we retry the code above, we'll see the following output:

```julia
Set([Point(2,3)])
```

