# set.seed(key + as.integer(Sys.Date())) as a possible seed?
draw_order <- sample(1:75, replace=TRUE)
for(k in seq_along(draw_order)) {
      request <- readline("Press Enter to draw the next number, or type 'drawn' to show drawn numbers \n")
      while (request == "drawn") {
            print(sort(draw_order[1:(k-1)]))
            request <- readline("Press Enter to draw the next number, or type 'drawn' to show drawn numbers \n")
      }
      if (draw_order[k]>=1 & draw_order[k]<=15){
            cat("B", draw_order[k], "\n")
      } else if (draw_order[k]>=16 & draw_order[k]<=30){
            cat("I", draw_order[k], "\n")
      } else if (draw_order[k]>=31 & draw_order[k]<=45){
            cat("N", draw_order[k], "\n")
      } else if (draw_order[k]>=46 & draw_order[k]<=60){
            cat("G", draw_order[k], "\n")
      } else {
            cat("O", draw_order[k], "\n")
      }
}
