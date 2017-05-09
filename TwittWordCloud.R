library(twitteR)
library(bitops)
library(RCurl)
library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)
consumer_key <- 'add_here' #consumer key
consumer_secret <- 'add_here' #consumer secret
access_token <- 'add_here' #access token
access_secret <- 'add_here' #access secret
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
DIS_tweets <- searchTwitter("Disney", n=1000, lang="en")
#str(DIS_tweets)
class(DIS_tweets)
DIS_tweets_text <- sapply(DIS_tweets, function(x) x$getText())
DIS_corpus <- Corpus(VectorSource(DIS_tweets_text))
DIS_Clean <- tm_map(DIS_corpus, removePunctuation)
DIS_Clean <- tm_map(DIS_Clean, content_transformer(tolower))
DIS_Clean <- tm_map(DIS_Clean, removeWords, stopwords("english"))
DIS_Clean <- tm_map(DIS_Clean, removeNumbers)
DIS_Clean <- tm_map(DIS_Clean, stripWhitespace)
DIS_Clean <- tm_map(DIS_Clean, removeWords, c("disney"))
wordcloud(DIS_Clean, random.order =F, colors=rainbow(50))
