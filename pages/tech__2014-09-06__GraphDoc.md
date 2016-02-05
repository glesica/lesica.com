# GraphDoc

I have been getting pretty interested in graph databases, and
[Neo4j](http://neo4j.org) specifically. One thing that is missing (AFAIK anyway)
from the graph database ecosystem is a good set of tools to help document a
graph data model. This is particularly important since Neo4j is schema-free,
meaning that it is incredibly flexible, but that it can turn into a mess in a
hurry. To prevent messes from happening, I typically want to document my data
model so that I can remind myself what things are supposed to look like as I
write code that interacts with the database.

In the past, I have used various diagramming tools. This makes some sense since
a graph data model can, naturally, be drawn out as a graph. The problem here is
twofold. First, a drawing doesn't "scale". In other words, at some point all
such diagrams turn into spaghetti, at which point they lose their value. The
second problem is that it is hard to include properties on a diagram, things
either get cluttered, or too little information gets lost. For instance, I might
want a required property called `name` on the `Person` node. Great. But what if
I also want 15 other properties? Or what if I want to remind myself which of
those properties are indexed? Not so great.

Enter [GraphDoc](https://github.com/glesica/graphdoc), which I hope will solve
some of these problems. You can read about it on GitHub, but the basic idea is
that a user creates a plain text document with some embedded tags (like JavaDoc
and similar) that inject some meaning. Then the document gets compiled to a nice
looking HTML page that can be shared or referenced locally, whatever. Check it
out!
