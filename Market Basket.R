## MArkert basket analysis

## load the librarires
library(arules)
library(arulesViz)
library(datasets)

## load data

data("Groceries")

## create an item frequency plot  for the top 20 items

itemFrequencyPlot(Groceries, topN = 20, type = "absolute")

## get the rules
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))

## show the top 5 rules but only 2 digits

options(digits = 2)
inspect(rules[1:5])                 
summary(rules)


## Sorting stuff out
rules <- sort(rules, by = "confidence", decreasing = T)
rules[1:5] 
rules
inspect(rules[1:20])

##  Targeting Items

rules <- apriori(data = Groceries, parameter = list(supp = 0.001, conf = 0.08),
                 appearance = list(default = "lhs", rhs = "whole milk"),
                 control = list(verbose = F))
rules <- sort(rules, by = "confidence", decreasing = T)
inspect(rules[1:20])

## Whole milk in lhs 
rules <- apriori(data = Groceries,
                 parameter = list(supp = 0.001, conf = 0.08),
                 appearance = list(default = "rhs", lhs = "whole milk"),
                 control = list(verbose = F)
                 )
rules <- sort(rules, by = "confidence", decreasing = T)
inspect(rules[1:20])

#vizualization
library(arulesViz)
plot(rules[1:10], method = "graph", interactive = TRUE, shading = NA)

