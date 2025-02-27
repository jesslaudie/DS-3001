library(tidyverse)
df <- read_csv("~/Desktop/DS-3001/week-11-reinforcement-lab/data-summary.csv")
df1 <- select(df, main_colors, opp_colors, on_play, num_turns, won)
df2 <- select(df,"deck_Adeline, Resplendent Cathar":"deck_Wrenn and Seven")
mat = data.matrix(df2)
vec1 <- vector()
vec3 <- vector()
for(i in 1:nrow(mat) ){
  x<-cor( mat[1,] , mat[i,])
  vec1 <- c(vec1,x)
  z<-cor( mat[47,] , mat[i,])
  vec3 <- c(vec3,z)
}

df1 <- df1 %>% mutate(cora = vec1)
df1 <- df1 %>% mutate(corc = vec3)

## Working with ggplot 

theme_set(theme_bw())

ggplot(df1,aes(x=cora,y=corc, col = won))+geom_point() + ggtitle("Relation of Decks to Cora and Corc Decks")

ggplot(df1,aes(x=cora,y=corc, col = won))+geom_point() + ggtitle("Relation of Decks to Cora and Corc Decks Based by On Play") + facet_wrap(~on_play) 
View(plot1)
