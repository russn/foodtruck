# R code for redoing preliminary analyses
library(igraph)

trucks <- read.csv("just truck-trucks.csv",header=TRUE) # read in data
edgelist <- trucks[,c("sender", "recipient")] # create edgelist

igraph <- graph.data.frame(edgelist) #convert edgelist to igraph object
indegree <- degree(igraph, mode=c("in"))
outdegree <- degree(igraph, mode=c("out"))
cor(indegree,outdegree)

data <- cbind(indegree,outdegree)
data <- as.data.frame(data)
attach(data)

plot(outdegree,indegree,xlim=c(0,480),xlab="Out-Degree",ylab="In-Degree")
text(outdegree, indegree, labels = row.names(data), pos = 4) # for all labels

plot(indegree,outdegree,xlim=c(0,240),ylim=c(0,400),xlab="In-Degree",ylab="Out-Degree")
text(data[7,], labels = row.names(data[7,]), pos = 4) # for individual labels, kogibbq
text(data[11,], labels = row.names(data[11,]), pos = 4) #thesweetstruck
abline(a=0,b=0.7883968) # line with correlation
