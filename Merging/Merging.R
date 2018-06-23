m <-read.csv(‘/Data/smallObj.csv') # adjust path to Data folder
ML<- read.csv(‘/Data/Meteorite_Landings.csv') # adjust path to Data folder
df = merge(m, ML, by=c("name","name"))
write.csv(df,file='Meteorites_smallObj.csv')


summary(df$pha)

barplot(table(df$class)) #http://pdssbn.astro.umd.edu/data_other/objclass.shtml
