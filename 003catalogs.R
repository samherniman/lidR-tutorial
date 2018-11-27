# 0 load packages ---------------------------------------------------------

library(lidR)

# 1 catalog ---------------------------------------------------------------

# The coolest thing about lidR, is the catalog.
# Its a way of looking at all your tiles without loading them into your memory

?`LAScatalog-class`

# let's give it a go
# replace the text in quotes with the location of your tile containing folder
# if you're on windows you will have to replace all the single slashes (\ or /) with double backslashes (\\)
# mine looks like this:  ctg = catalog("D:\\lidar\\Data\\site1")

ctg = catalog("folder\\to\\las")

# you might get a lot of warnings. that could be horrible or it could be totally fine
# when its finished running, we can have a look at if it worked

ctg

# This command tells you about the LAScatalog you just created
# What is the average point density of the catalog? (that's under density)
# it probably tells you a number in metres squared or units squared
# what about the coordinate system? does it use UTM or WGS?

# 2 adding a coordinate system (CRS)---------------------------------------

# if coord. ref says "NA", we should add one
# if it doesn't, you can skip to step 3
# you'll have to look up your own coordinate system depending on your data
# if your data has an info file, it should be listed inside that
# if not, try looking here: https://epsg.io/

# uncomment the next line and replace my EPSG code (32621) with yours:

# ctg@proj4string = sp::CRS("+init=epsg:32621")
ctg
# has the CRS changed now?

# 3 setting cores ---------------------------------------------------------

# if your machine has multiple cores, you can take advantage of those
# replace the 4 with the number of cores you want to use:
opt_cores(ctg) <- 6L
opt_cores(ctg)


# let's have a look
plot(ctg)
# sp::spplot(ctg)

# if you have any trouble, check:
?catalog
?`LAScatalog-class`
# https://github.com/Jean-Romain/lidR/wiki/catalog

# you are free to move on to the next step