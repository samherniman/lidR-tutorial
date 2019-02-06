
# 001 downloading the necessary packages ----------------------------------


# Rtools ------------------------------------------------------------------

# First, you'll need Rtools
# If you have it already, you can skip this step
# if you don't know, check by going to start and type "Rtools" (on windows)
# if a file comes up like "Rtools34.exe" or something similar, you probably have it

# if not
# go to: https://cran.r-project.org/bin/windows/Rtools/
# and download and install Rtools34.exe
# yes, I know that there is a newer version called Rtools35.exe
# you're free to try it, but I haven't used it with lidR yet, and it might not work



install.packages("lidR")

# devtools ----------------------------------------------------------------

# Next, run this line:
install.packages("devtools")

# If you already have it, nothing should happen


# rlas --------------------------------------------------------------------

# Okay. Now we need rlas:
devtools::install_github("Jean-Romain/rlas", dependencies=TRUE)
# If that worked, move on to the next step
# problems? https://github.com/Jean-Romain/rlas


# RCSF --------------------------------------------------------------------

devtools::install_github("Jean-Romain/RCSF")
# problems? https://github.com/Jean-Romain/RCSF

# lidR 2.0 ----------------------------------------------------------------

# This one might be trickier
devtools::install_github("Jean-Romain/lidR", dependencies=TRUE, ref="devel")

# If it worked, you can move on to the next R file, "002tilesandindex.R"
# If that didn't work, try closing Rstudio and running that line again

# If that did work, figure out what R version you are using by running this:
version
# It should be under major and minor
# If it says R 3.4, download this: https://drive.google.com/open?id=1Sfd_8uAY7xI4SNWrscsi1v03y_LA2ZVm
# If it says R 3.5, download this: https://drive.google.com/open?id=1EEUpN2m344VWbf_VsYnUrxuiV63e8ngT
# If it says R 3.6, download this: https://drive.google.com/open?id=1dchHA6fIT8TipXAkXUYX-vmhnWGNJtUZ

# Now try to install it using the zip file by going to Packages (its probably on the right side of the screen)
# then clicking Install, and chooosing to install from package archive file
# then find the file you just downloaded

# If that didn't work, you're pretty much stuck.
# Go here, https://github.com/Jean-Romain/lidR/issues/177
# In case something has changed since I last looked.

# If you finally got it to work, you can now move on to the next R file: "002tilesandindex.R"