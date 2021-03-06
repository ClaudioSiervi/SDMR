library(tidyverse)


inc <- read_csv("papers/SD tidyverse/data/Incidence.csv")

slice(inc,1:6)

t_inc <- gather(inc,Cohort,Incidence,Young:Elderly)

slice(t_inc,1:8)

y_data <- filter(t_inc,Cohort=="Young")

s_data <- select(inc,Week:Young)

slice(s_data,1:6)

srt <- arrange(wk_tot,desc(Incidence))

slice(srt,1:6)

add_col <- mutate(wk_tot,AttackRate=100*Incidence/8000)

slice(add_col,1:6)


wk_tot <- t_inc %>% group_by(Week) %>%
  summarise(Incidence=sum(Incidence))

slice(wk_tot,1:6)



ggplot(data=y_data,mapping = aes(x=Week,y=Incidence)) + 
      geom_line() + geom_point()

ggplot(t_inc,aes(x=Week,y=Incidence,color=Cohort)) + geom_line()

ggplot(t_inc,aes(x=Week,y=Incidence,fill=Cohort)) + geom_area()









# get the totals sick by cohort
t_inc %>% group_by(Cohort) %>% 
           summarise(TotalInfected=sum(Incidence),
                     PeakValue=max(Incidence),
                     AvrValue=mean(Incidence),
                     SD=sd(Incidence),
                     MinValue=min(Incidence),
                     MaxValue=max(Incidence))


