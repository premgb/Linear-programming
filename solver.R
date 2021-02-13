#######################################################################################
##                                                                                   ##
## Linear programming (optimization technique)                                        ##
##                                                                                   ##
#######################################################################################
#install.packages("lpSolveAPI")
library(lpSolveAPI)

#number of decision variables
lprec <- make.lp(0, 4)

#Objective function definition
set.objfn(lprec, c(15, 12, 9, 10))   
lp.control(lprec,sense='max')  

#Constraints
#C1
add.constraint(lprec, c(3, 4, 7, 9), "<=", 24)
#C3
add.constraint(lprec, c(18, 14.4, -9, 0), "<=", 0)
#C4
add.constraint(lprec, c(1, 1, 1, 1), "=", 1)
#C5
set.bounds(lprec, lower = c(0,0,0,0), columns = c(1,2,3,4))
#C2
set.bounds(lprec, upper = c(.45,.45,.45,.45), columns = c(1,2,3,4))

RowNames <- c("Average risk index", "Govt bond return", "Cash available")
ColNames <- c("X1", "X2", "X3", "X4")
dimnames(lprec) <- list(RowNames, ColNames)

lprec
solve(lprec)
#if output is zero then it's successfull or else check your formulation

get.objective(lprec)     #optimal value of objective function
get.variables(lprec)     #optimal value of D.V. - decision variables
get.constraints(lprec)

#free R resources - once you are done!
rm(lprec)

#That's it, folks!
