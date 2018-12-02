barplot(res$eig[,2], names.arg = 1:nrow(res$eig))
drawn <-
"273"
plot.MCA(res, select = drawn, axes = 1:2, choix = 'ind', invisible = c('var', 'quali'), title = '', cex = cex)
drawn <-
c("15-24", "student", "chain store", "tearoom", "Not.tearoom", 
"chain store+tea shop", "Earl Grey", "Not.friends", "friends"
)
plot.MCA(res, selectMod = drawn, axes = 1:2, choix = 'ind', invisible = 'ind', title = '', cex = cex)
drawn <-
"208"
plot.MCA(res, select = drawn, axes = 3:4, choix = 'ind', invisible = c('var', 'quali'), title = '', cex = cex)
drawn <-
c("tea bag", "breakfast", "Not.breakfast", "tea shop", "feminine", 
"Not.feminine", "senior", "unpackaged", "non-worker")
plot.MCA(res, selectMod = drawn, axes = 3:4, choix = 'ind', invisible = 'ind', title = '', cex = cex)
drawn <-
"151"
plot.MCA(res, select = drawn, axes = 5:6, choix = 'ind', invisible = c('var', 'quali'), title = '', cex = cex)
drawn <-
c("No.exciting", "exciting", "+60", "non-worker", "work", "Not.work", 
"employee", "unpackaged", "middle")
plot.MCA(res, selectMod = drawn, axes = 5:6, choix = 'ind', invisible = 'ind', title = '', cex = cex)
drawn <-
"130"
plot.MCA(res, select = drawn, axes = 7:8, choix = 'ind', invisible = c('var', 'quali'), title = '', cex = cex)
drawn <-
c("Not.healthy", "healthy", "No.slimming", "slimming", "lunch", 
"Not.lunch", "effect on health", "No.effect on health", "+2/day"
)
plot.MCA(res, selectMod = drawn, axes = 7:8, choix = 'ind', invisible = 'ind', title = '', cex = cex)
drawn <-
"92"
plot.MCA(res, select = drawn, axes = 9:10, choix = 'ind', invisible = c('var', 'quali'), title = '', cex = cex)
drawn <-
c("Not.home", "home", "No.effect on health", "effect on health", 
"escape-exoticism", "Not.escape-exoticism", "3 to 6/week", "alone", 
"No.relaxing")
plot.MCA(res, selectMod = drawn, axes = 9:10, choix = 'ind', invisible = 'ind', title = '', cex = cex)
drawn <-
"149"
plot.MCA(res, select = drawn, axes = 11:12, choix = 'ind', invisible = c('var', 'quali'), title = '', cex = cex)
drawn <-
c("escape-exoticism", "Not.escape-exoticism", "1/day", "middle", 
"Not.evening", "evening", "1 to 2/week", "lemon", "3 to 6/week"
)
plot.MCA(res, selectMod = drawn, axes = 11:12, choix = 'ind', invisible = 'ind', title = '', cex = cex)
drawn <-
"149"
plot.MCA(res, select = drawn, axes = 13:14, choix = 'ind', invisible = c('var', 'quali'), title = '', cex = cex)
drawn <-
c("Not.iron absorption", "iron absorption", "35-44", "workman", 
"No.effect on health", "effect on health", "Not.dinner", "dinner", 
"p_private label")
plot.MCA(res, selectMod = drawn, axes = 13:14, choix = 'ind', invisible = 'ind', title = '', cex = cex)
res.hcpc = HCPC(res, nb.clust = -1, graph = FALSE)
drawn <-
"273"
plot.HCPC(res.hcpc, choice = 'map', draw.tree = FALSE, select = drawn, title = '')
