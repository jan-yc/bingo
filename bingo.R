bset <- 1L:15L
iset <- 16L:30L
nset <- 31L:45L
gset <- 46L:60L
oset <- 61L:75L

generate <- function(quantity, seeded = FALSE, key = 0L){
      if (seeded == TRUE & !is.integer(key)){
            if(!is.numeric(key)) stop("Specified key is not a number")
            key <- as.integer(round(key))
      }
      
      for(j in 1:quantity) {
            if(seeded==TRUE){
                  set.seed(key + j)     # if cards need to be reproduced
                  # to ensure key is coerced to integer
                  seeds <- sample.int(1000, 5)
            }
                  if(seeded==TRUE) set.seed(seeds[1]);
            B <- sample(bset, 5)
                  if(seeded==TRUE) set.seed(seeds[2]);
            I <- sample(iset, 5)
                  if(seeded==TRUE) set.seed(seeds[3]);
            N <- sample(nset, 5)           
                  if(seeded==TRUE) set.seed(seeds[4]);
            G <- sample(gset, 5)
                  if(seeded==TRUE) set.seed(seeds[5]);
            O <- sample(oset, 5)
            
            card <- cbind(B, I, N, G, O)
            card[3,3] <- "FREE" #replace 0L free space with text string
            
            if(!dir.exists("bingocards")) dir.create("./bingocards")
            # older excess cards are not overwritten as of now
            setwd("./bingocards")
            write.csv(card, file = paste("bingocard", j, ".csv", sep=""), 
                      quote = FALSE)
            setwd("..")
      }
}