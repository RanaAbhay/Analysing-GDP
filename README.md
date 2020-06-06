# Analysing-GDP
US states and World GDP 2018
This analysis includes data from "https://en.wikipedia.org/wiki/Comparison_between_U.S._states_and_sovereign_states_by_GDP" and is an attempt to immulate the wikipedia world map graphics -

map data for world taken from ggplot's map_data("world") and similarly state data from map_data("state) - recently that learned fiftystater is no more active on CRAN 


There are still some issues with the map png - as some regions are not showing their required GDP category (like California).
It is perhaps a basic thing, however as a new bee in R, it means a lot to learn various functions and features while experimenting with an already built model.
Please go through my code and suggest how could I improve. I will be happy in learning your thoughts - 



sessionInfo()


R version 4.0.0 (2020-04-24)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 16299)

Matrix products: default

locale:
[1] LC_COLLATE=Unknown Language (en)_Unknown Region (EN).1252 
[2] LC_CTYPE=Unknown Language (en)_Unknown Region (EN).1252   
[3] LC_MONETARY=Unknown Language (en)_Unknown Region (EN).1252
[4] LC_NUMERIC=C                                              
[5] LC_TIME=Unknown Language (en)_Unknown Region (EN).1252    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] ggplot2_3.3.0 tidyr_1.0.3   maps_3.3.0    dplyr_0.8.5   readxl_1.3.1 

loaded via a namespace (and not attached):
 [1] Rcpp_1.0.4.6     rstudioapi_0.11  magrittr_1.5     munsell_0.5.0    tidyselect_1.0.0 colorspace_1.4-1
 [7] R6_2.4.1         rlang_0.4.5      fansi_0.4.1      tools_4.0.0      grid_4.0.0       gtable_0.3.0    
[13] xfun_0.13        tinytex_0.22     cli_2.0.2        withr_2.2.0      ellipsis_0.3.0   digest_0.6.25   
[19] assertthat_0.2.1 tibble_3.0.0     lifecycle_0.2.0  crayon_1.3.4     farver_2.0.3     purrr_0.3.4     
[25] vctrs_0.2.4      glue_1.4.0       labeling_0.3     compiler_4.0.0   pillar_1.4.3     cellranger_1.1.0
[31] scales_1.1.0     pkgconfig_2.0.3 
