# load the ggplot2 library for data visualization
library(ggplot2)

# get data from a csv file (R doesn't like xlsx) and save it into a variable
friction <- read.csv("Friction-Exam.csv", header = TRUE, sep = ",")

# plot 1 (scatter, mass vs. friction)
ggplot(friction, aes(x = (Actual.Weight/1000)*9.81, y = Average,
    shape = Surface)) + geom_point() +
    geom_line(stat="smooth", method = "lm",
    alpha = 0.3, fullrange = TRUE, se = 0.2) + xlim(0, 6) +
    xlab("Weight (newtons)") + ylab("Average Friction (newtons)") + 
    ggtitle("Friction Experienced by a Weighted Wooden Block on Different Surfaces")

# plot 2 (scatter, mass vs. friction, separated by surface)
ggplot(friction, aes(x = (Actual.Weight/1000)*9.81, y = Average,
    colour = Surface)) + geom_point() + stat_smooth(method = "lm",
    alpha = 0.1, fullrange = TRUE, se = 0.2) + xlim(0, 6) +
    xlab("Weight (newtons)") + ylab("Average Friction (newtons)") + 
    ggtitle("Friction Experienced by a Weighted Wooden Block on Different Surfaces") + 
    facet_wrap(~Surface) + guides(colour = FALSE)

# plot 3 (scatter, dynamic vs. static friction)
ggplot(friction, aes(x = Average, y = Static.Friction)) +
  geom_point() + geom_smooth(method = "lm") + xlim(0, 3) +
  xlab("Dynamic Friction (N)") + ylab("Static Friction (N)") +
  ggtitle("Dynamic Friction vs. Static Friction")
