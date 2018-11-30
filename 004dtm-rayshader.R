
# The next step is to calculate a digital terrain model

# 0 load packages ---------------------------------------------------------

# old package:
library(lidR)
# new packages:
devtools::install_github("tylermorganwall/rayshader")
library(magrittr)
library(rayshader)
library(raster)

# 1 make a digital terrain model DTM --------------------------------------
?grid_terrain
# This will make a digital terrain model
# resolution (res) should be in metres. you might want to make it smaller
# but remember that it might take longer to calculate if you do 
# this is where you might want to take advantage of multiple cores

dtm = grid_terrain(ctg, res = 100, knnidw(k=10,p=2), keep_lowest = FALSE)

# you can save your dtm with:
# writeRaster(dtm, filename = "dtm.grd", format = "raster", overwrite = T)

# 2 rayshade --------------------------------------------------------------
# making a pretty hillshade

# hava a look at this page:
# https://github.com/tylermorganwall/rayshader
# it will explain everything better than I can

elmat = matrix(raster::extract(dtm,raster::extent(dtm),buffer=1000),
               nrow=ncol(dtm),ncol=nrow(dtm))

raymat = ray_shade(elmat,lambert = TRUE)
ambmat = ambient_shade(elmat)
lambmat = lamb_shade(elmat)

elmat %>%
  sphere_shade(texture="desert") %>%
  add_water(detect_water(elmat, min_area = 40), color="desert") %>%
  add_shadow(raymat, 0.7) %>%
  add_shadow(ambmat, 0.7) %>%
  add_shadow(lambmat, 0.7) %>% 
  plot_map()

# if you want to save a copy of your hillshade, use:
# elmat %>%
#   sphere_shade(texture="desert") %>%
#   add_water(detect_water(elmat, min_area = 40), color="desert") %>%
#   add_shadow(raymat, 0.7) %>%
#   add_shadow(ambmat, 0.7) %>%
#   add_shadow(lambmat, 0.7) %>% 
#   save_png(filename = "hillshadename")

# you're probably ready to move on

# elmat %>% 
#   sphere_shade(texture = "desert") %>% 
#   add_shadow(raymat, 0.7) %>%
#   add_shadow(ambmat, 0.7) %>%
#   add_shadow(lambmat, 0.7) %>%
#   plot_3d(elmat, zscale=10,fov=0,theta=135,zoom=0.75,phi=45, windowsize = c(1000,800), water = F)
# render_depth(focus=0.6,focallength = 200)