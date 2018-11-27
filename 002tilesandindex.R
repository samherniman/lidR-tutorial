
# if you know that your data is tiled and indexed, 
# you can skip this file entirely and move to 003catalogs.R


# 1 tiling ----------------------------------------------------------------

# lidar files come in many different formats
# the ones that we are most intersted in are .las and .laz
# there is pretty much no difference between them except that .laz is smaller
# if you ever have the option to, work with .laz over .las


# first things first, is your data tiled?
# the easy way to figure it out is to look in the folder that you keep your point clouds 
# how many .laz or .las files are in there? If there are hundreds and they are less that 100MB, --> skip to step 2
# if its just one or two, they probably aren't tiled
# if they are less that 100MB or so, you probably won't have to tile them and you can skip to step 2
# but if you only have one or two files, and they are bigger than 100MB, you should probably tile them

# At the moment this guide doesn't go into how to tile your data because lidR doesn't have its own way of doing it
# but here are some really rough steps:

# -https://rapidlasso.com/lastools/
# use the lastools arctoolbox in ARCgis. it makes things very simple
# -use lasindex
# -use lastile into a new folder 
# -use lasindex again

# great! you tiled your data


# 2 index -----------------------------------------------------------------

# Let's look in the folder containing your point cloud data again.
# You should have .laz tiles in there
# do you have any .lax files too?
# these are index files and they tell your computer where each tile is located spatially
# they are not required, but they speed things up when you have many tiles

# if you don't have any .lax files, you should create some using lasindex from lastools (https://rapidlasso.com/lastools/)
# or Catalog in fusion http://forsys.cfr.washington.edu/fusion/fusionlatest.html
# hint hint. if you use lasindex, use the lastools arctoolbox in ARCgis. it makes things very simple

# Okay. We should be finally done with the preparation phase
# Open "003catalogs.R" and we can use lidR for the first time