## This script visualizes Dolphin Social Network
## It clusterizes the network and plots distinct clusters with distinct colors
## More socialized dolphins are represented with bigged dots
## while less socialized are represented with smaller dots

## data can be downloaded from here:
## https://networkdata.ics.uci.edu/data.php?id=6

#install.packages("igraph")
library(igraph)

# read graph
g <- read.graph("dolphins.gml", format="gml")

# clusterize
cl <- cluster_edge_betweenness(g)

# set the sizes of the vertices
V(g)$size <- sqrt( 10 * degree(g) )

# plot the graph
plot(cl, g, 
     layout = layout.kamada.kawai,
     main = 'Dolphin Social Network',
     vertex.label.degree = -pi/2,
     vertex.label.dist = 0.25,
     vertex.label.color = 'black',
     vertex.label.cex = 1,
     vertex.label.font = 2,
     #edge.color = 'white',
     vertex.frame.color = NA
     )

