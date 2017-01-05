# the generate function takes 3 arguments:
# quantity -    number of bingo cards to generate; set to 0 to remove all cards 
#               but not create any new ones
# seeded -  whether to control random card generation (in case you somehow lost 
#           a card and want to regenerate the exact same numbers)
# key -     seed modifier 

# open & print the cards with another program based on your preference

generate <- function(quantity, seeded = FALSE, key = 0L){
        # creates a directory to store generated cards. removes old cards everytime
    # this function is called
    if(!dir.exists("bingocards")) dir.create("./bingocards")
    oldcards <- list.files("./bingocards", full.names = TRUE)
    file.remove(oldcards)
    
    # if quantity is 0, all cards are deleted and no new cards are made
    if(quantity == 0) return(message("All cards deleted"))
    
    # checks that the key provided is an integer, if seeding is desired
    if (seeded == TRUE & !is.integer(key)){
        if(!is.numeric(key)) {
            stop("Specified key must be an integer", call. = FALSE)
        }
        key <- as.integer(round(key))
    }
    
    # initial pool of numbers
    pool <- as.data.frame(matrix(1L:75L, ncol = 5))
    colnames(pool) <- c("B", "I", "N", "G", "O")
    
    # generates the cards at random, or by seed
    for(j in 1:quantity) {
        if(seeded==TRUE) set.seed(key + j)
        card <- vapply(pool, sample, FUN.VALUE = integer(5), size = 5) # samples 5 per column
        card[3,3] <- "FREE" # free space
        
        write.csv(card, file = paste("./bingocards/bingocard", j, ".csv", sep=""), 
                  quote = FALSE, row.names = FALSE)
    }
}
