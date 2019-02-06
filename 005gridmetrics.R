# There are generally two ways of analysing point cloud data in forestry:
# -Area based in which the structure of forest cells are summarised 
# -Tree based in which individual trees are delimited and analysed

# I never use tree based methods, so I won't go into those until later




# 0 load packages ---------------------------------------------------------

# old packages
library(lidR)

# 1 grid metrics ----------------------------------------------------------

# calculating grid metrics is exactly like calculating a DTM - you're just
# summarizing each cell

?grid_metrics

# this next line will output a whole bunch of standard metrics
?stdmetrics
# there is an excellent guide to them on the lidR wiki
metrics = grid_metrics(ctg, .stdmetrics, res = 500)

# you might notice that a helpful map shows which clusters (tiles) have
# been calculated.
# if you can't see it, look under "Plots"



# 2 defining your own metrics ---------------------------------------------

# you can also specify metrics of your own creation with a function.
# Here is an example from the lidR documentation:
myMetrics = function(z, i)
{
  metrics = list(
    zwimean = sum(z*i)/sum(i), # Mean elevation weighted by intensities
    zimean  = mean(z*i),       # Mean products of z by intensity
    zsqmean = sqrt(mean(z^2))  # Quadratic mean
  )
  
  return(metrics)
}
# you can calculate it with this:
metrics = grid_metrics(ctg, myMetrics(Z, Intensity), res = 500)

# and here is an example I use:

myMetrics = function(z)
{
  probs = c(0.2, 0.8) # defines the percentiles you want to calculate
  zq = as.list(stats::quantile(z, probs))
  names(zq) = c("z20", "z80")  # labels the percentiles
  metrics = c(zq, zsd = sd(z)) # defines the metrics, percentiles
                               # and standard deviation
  return(metrics)
}

# and again, this is how you calculate the metrics:
metrics = grid_metrics(ctg, myMetrics(Z), res = 500)

# and this is how one looks at them:
plot(metrics)