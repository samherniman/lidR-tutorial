# now that we have created a dtm, we can focus on the trees

# to do this, we have to normalise the data. i.e. we can take the ground
# away so that we are left with only the trees



# 0 packages --------------------------------------------------------------

# old packages
library(lidR)


# 1 classify the ground ---------------------------------------------------

# to normalise the data, we need to know which points are from the ground 
# and which ones are trees

# your pointcloud might already be classified, in which case you can skip
# to step 4

?lasground

# R isn't able to handle all the groundclassified points at once,
# so we have to specify a place to save them
# let's change the catalog options to where you want the ground classified
# data saved

# replace the path\\to\\output\\folder\\ground_{XCENTER}_{YCENTER} with 
# the path to your output folder. 
# remeber to keep the {XCENTER}_{YCENTER} there so that lidR can name each 
# tile differently
# and remember to replace single slashes with double backslashes \\ on windows
opt_output_files(ctg) = "path\\to\\output\\folder\\ground_{XCENTER}_{YCENTER}"

# and lets make sure that it will write the files as .laz
opt_laz_compression(ctg) = T

# now we can run lasground
# there are two different algorithms to define ground points
# you only need to use one of them
# cloth simulation filter (CSF) and progressive morphological filter (PMF)

# using csf is like this:
?csf
lasground(ctg, csf())

# using pmf is like this:
?pmf
ws <- seq(3,12, 3)
th <- seq(0.1, 1.5, length.out = length(ws))
lasground(ctg, pmf(ws, th))


# 2 index -----------------------------------------------------------------
# at this point, you might want to index the tiles you just made
# you'll have to use lastools or fusion for this again

# 3 catalog ---------------------------------------------------------------

# now we should read the new ground classified pointcloud in
# I'm going to overwrite my old catalog (ctg) but its perfectly acceptable
# to make a new catalog if you think you will use the old one later

ctg = catalog("folder\\to\\ground\\classified\\tiles")

# make sure you specify cores and check that the crs is correct!

# 4 normalise -------------------------------------------------------------

# now we get to normalise the point cloud
# its pretty much the same process as ground classifying

# we have to specify an output folder
opt_output_files(ctg) = "path\\to\\output\\folder\\ground_{XCENTER}_{YCENTER}"

# and let's make sure that it will write the files as .laz
opt_laz_compression(ctg) = T

?lasnormalize

# The simplest way to run it is like this:
lasnormalize(ctg)

# but we can also specify an algorithm like this:
lasnormalize(ctg, tin())

# we can even specify the dtm that we created earlier:
lasnormalize(ctg, dtm)

# 5 index and catalog again -----------------------------------------------

# Again, you'll want to index the new tiles you create and read them in as
# a catalog

# I'm going to overwrite my old catalog because I'm all about the 
# future. But there is no reason for you to do that

ctg = catalog("folder\\to\\normalized\\tiles")

# now you are ready to create some grid metrics