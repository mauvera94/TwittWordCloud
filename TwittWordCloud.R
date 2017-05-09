library(twitteR)
library(bitops)
library(RCurl)
library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)
consumer_key <- 'iUtZrTvg8f9qEqSbUVf4S92fE'
consumer_secret <- 'kaZF4ADfLw4oyyZHrxsrzzTWEE3WexzXFgZBz9rHskh34WzdHV'
access_token <- '298193482-hEUI3N0JBJQtygtDhxWQasEHp3M5TEkA4LCaVx2Y'
access_secret <- 'h1go1snQETEUfj5egEQOl6KmiIgzNXrZt4dhLq5q09R57'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
DIS_tweets <- searchTwitter("Artificial+Intelligence", n=1000, lang="en")
#str(DIS_tweets)
class(DIS_tweets)
DIS_tweets_text <- sapply(DIS_tweets, function(x) x$getText())
DIS_corpus <- Corpus(VectorSource(DIS_tweets_text))
DIS_Clean <- tm_map(DIS_corpus, removePunctuation)
DIS_Clean <- tm_map(DIS_Clean, content_transformer(tolower))
DIS_Clean <- tm_map(DIS_Clean, removeWords, stopwords("english"))
DIS_Clean <- tm_map(DIS_Clean, removeNumbers)
DIS_Clean <- tm_map(DIS_Clean, stripWhitespace)
DIS_Clean <- tm_map(DIS_Clean, removeWords, c("artificial", "intelligence"))
wordcloud(DIS_Clean, random.order =F, colors=rainbow(50))