# Food truck project

## Project structure

* The `R` directory contains the relevant scripts to work with the data
* Data is pulled using `source script.sh` e.g. `source just-truck-trucks.sh` in the `R/data` folder

### Sample prelimary analysis

```{r echo=FALSE}
trucks <- read.csv("data/just-truck-trucks.csv",header=TRUE) # read in data
edgelist <- trucks[,c("sender", "recipient")] # create edgelist

igraph <- graph.data.frame(edgelist) #convert edgelist to igraph object
indegree <- degree(igraph, mode=c("in"))
outdegree <- degree(igraph, mode=c("out"))
cor(indegree,outdegree)

```

