# Answers
#Vector Indexing
logical.v[2]
example.v[which(!example.v %in% example2.v)]

# list indexing
list_of_lists[[2]][[3]]

# for loop and lapply
favs <- c("In Bruges", "Stuart Little 2", "Avatar: The Last Airbender")

for(i in 1:length(favs)){
  print(paste("One of my favorite movies is:", favs[i], collapse = ""))
}

list_fun <- function(x){
  y <- paste("One of my favorite movies is:", x, collapse = "")
  return(y)
}

fav.l <- lapply(favs, list_fun)
fav.l

# dataframe
within_one <- subset(class, Age >= mean_age - sd_age & Age <= mean_age + sd_age)