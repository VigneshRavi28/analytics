#Classification - mtcars

library(rpart)
library(rpart.plot)

df = mtcars
df$am = factor(df$am)
#predict likelihood of car being auto or manual using DT

rpart.fit = rpart(am ~ wt + cyl + mpg + hp + gear, data=df, minsplit=7, cp=-1)
rpart.fit

rpart.plot(rpart.fit, cex=1, nn=T)

library(dplyr)
ndata = sample_n(df,5)
ndata = ndata[c('am','wt','cyl','mpg','hp','gear')]
ndata
predict(rpart.fit, newdata=ndata, type='prob')
predict(rpart.fit, newdata=ndata, type='class')
cbind(ndata, predicted=predict(rpart.fit, newdata=ndata, type='class') )



rpart.fit1 = rpart(am ~ wt + cyl + mpg + hp + gear, data=df, minsplit=7)
rpart.fit1
rpart.plot(rpart.fit1)
