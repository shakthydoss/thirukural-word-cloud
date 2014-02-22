# Thirukural world could. 
# Author: shakthydoss
# website: http://shakthydoss.com


#loadind text mining libary and wordcloud libary.
library("tm")
library("wordcloud")

data <- Corpus(DirSource("//Corpus"))
data <- tm_map(data , stripWhitespace)
term.matrix <- TermDocumentMatrix(data)
term.matrix <- as.matrix(term.matrix)
v <- sort(rowSums(term.matrix), decreasing=TRUE )
d <- data.frame(word = names(v),freq=v)

# saving word cloud chart.
png("wordcloud.png", width=1280,height=800)
wordcloud(d$word,d$freq, scale=c(7,0.15),min.freq=3, max.words=133, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))
dev.off()


