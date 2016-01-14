# load required libraries
library(tidyr)
suppressWarnings(require(ohicore)) # source('install_ohicore.r')

# set working directory to the scenario directory, ie containing conf and layers directories
setwd('~/github/cdz/gulfo2015')

# load scenario configuration
conf = Conf('conf')

# run checks on scenario layers
CheckLayers('layers.csv', 'layers', flds_id=conf$config$layers_id_fields)

# load scenario layers
layers = Layers('layers.csv', 'layers')

# calculate scenario scores
scores = CalculateAll(conf, layers, debug=F)

write.csv(scores, 'scores.csv', na='', row.names=F)
