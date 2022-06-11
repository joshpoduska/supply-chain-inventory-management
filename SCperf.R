install.packages('SCperf')
library(SCperf)

# Newsboy(m, sd, p, c, s = 0)
# Example Porteus #
# Suppose demand is normally distributed with mean 100 and standard
# deviation 30. If p = 4 and c = 1, then CR = 0.75 and Q=120.23.
# Note that the order is for 20.23  units (safety stock) more than the
# mean. Note also that ExpC(120.23) = 38.13 and ExpP(120.23)=261.87,
# with FR=0.96.
Newsboy(100,30,4,1)

# Example Gallego #
# Suppose demand is normal with mean 100 and standard deviation 20. The
# unit cost is 5, the holding and penalty cost are 1 and 3
# respectively. From the definition of the holding and penalty
# cost we find that p=4, then CR = 0.75 and Q = 113.49. Notice that the
# order is for 13.49 units (safety stock) more than the mean,
# ExpC(113.49) = 25.42 and ExpP(113.49) = 274.58, with fill rate of
# 97 percent.
Newsboy(100,20,4,1)

# ROP(SL, md, sd, L = 1)
# Arguments
# SL - Service level, a value between 0 and 1
# md -Mean demand
# sd - Standart deviation of the demand
# L - A positive lead-time
ROP(0.9,2500,500,6)

# SS(SL, sd, L = 1)
# SL - Service level, a value between 0 and 1
# sd - Standart deviation of the demand
# L - A positive lead-time
# Value - Safety stock level over lead-time
SS(0.95,0.7,2)

# EOQ(d, k, h, b = 0)
# d - Demand per unit time.
# k - Ordering or fixed cost per order.
# h - Holding cost per unit of product.
# b - Shortage penalty cost per unit (default:0)
# Value  - A list containing:
# T
# Time between orders (cycle length)
# S
# Maximum backorders in units. Displayed when b > 0
# TVC
# Total variable cost.

#Classical EOQ model
#Given demand d=8000 items per year; set up cost k=12000; and holding cost h=0.3
#per unit we find that the optimal solution is to order 25298 units every 3.2
#months with a total variable cost of $7589.5
EOQ(8000,12000,0.3)

#EOQ model with planned shortages
#Consider now that backorders are allowed with a backorder cost b=1.1 per
#unit and year. Then the optimal solution is to order 28540 units every 3.6 months.
#The total variable cost is $6727.3 and the maximum shortage is 6116 units.
EOQ(8000,12000,0.3,1.1)

# EPQ(d, p, k, h, b = 0)
# Arguments
# d
# Deterministic demant per time unit
# 
# p
# Production rate
# 
# k
# Ordering or fixed cost per order.
# 
# h
# Holding cost per unit of product.
# 
# b
# Shortage penalty cost per unit (default:0).
# 
# 
# Value
# EPQ() returns a list containing:
#   
# Q
# Order quantity
# 
# t
# Time required to produce the batch quantity
# 
# T
# Time between orders (cycle length or time)
# 
# I
# Maximum inventory level
# 
# TC
# Total cost
# 
# Examples
#Suppose k = 100, h = 5, d = 200, p = 1000. Then the production run at
#t=0.1, the optimal order interval is T = 0.5, the optimal order quantity
#is Q = 100, the maximum inventory level is I=80 and the total cost is
#TC = $400.
EPQ(d=200,p=1000,k=100,h=5)


# WW(x, a, h, method = c("backward", "forward"))
# Arguments
# x
# A numeric vector containing the demand per unit time
# 
# a
# A numeric number for the set-up cost per unit and period
# 
# h
# A numeric number for the holding cost per unit and period
# 
# Example from Hiller, p.952, reproduced bellow:
# An airplane manufacturer specializes in producing small airplanes. It has just received
# an order from a major corporation for 10 customized executive jet airplanes for the use of
# the corporation's upper management. The order calls for three of the airplanes to be delivered
# (and paid for) during the upcoming winter months (period 1), two more to be delivered during
# the spring (period 2), three more during the summer (period 3), and the final two during the fall
# (period 4). Setting up the production facilities to meet the corporation's specifications for
# these airplanes requires a setup cost of $2 million.
# The manufacturer has the capacity to produce all 10 airplanes within a couple of months, when the
# winter season will be under way. However, this would necessitate holding seven of the airplanes in
# inventory, at a cost of $200,000 per airplane per period, until their scheduled delivery times
# (...) Management would like to determine theleast costly production schedule for filling
# this order.
x  <- c(3,2,3,2)
a  <- 2
h  <- 0.2
WW(x,a,h,method="backward")

# The total variable cost is $4.8 million (minimum value in the first raw). Since we have two
# minimun values in the first raw (positions 2 and 4), we have the following solutions:
# Solution 1:  Produce to cover demand until period 2, 5 airplanes. In period 3, new decision,
# minimun value 2.4 in period 4 (third raw). Then in period 3 produce to cover demand until 
# period 4, 5 airplanes.
# Solution 2: Produce to cover demand until period 4, 10 airplanes.
WW(x,a,h,method="forward")

