library(tidytuesdayR)
library(tidyverse)
tuesdata <- tidytuesdayR::tt_load('2022-02-22')
tuesdata$freedom%>%
  filter(country=="India")->India

India%>%
  select(-c(country,Region_Code,Region_Name,is_ldc))%>%
  data.frame()->data

colnames(data)<-c("year","Civil Liberties","Political Rights","Status")

data%>%
  gather("variable","value",2:3)->data1


ggplot(data1,aes(year,value))+
  geom_line(aes(group=variable,colour=variable),size=1.74)+
  scale_y_continuous(limits=c(1,7),breaks=c(1,2,3,4,5,6,7))+
  scale_x_continuous(limits=c(1995,2020),breaks=c(1995,1996,1997,1998,1999,2000,
                                                  2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020))+
  scale_colour_manual(values=c("#ffa5c6","#21a5ff"))+
  labs(colour=" ")+
  theme(plot.margin=unit(c(0.5,1.5,0.5,1.5),"cm"),
        plot.background = element_rect(fill="black"),
        panel.background = element_rect(fill="black"),
        axis.text = element_text(colour="white",size=10,face="bold"),
        axis.title.x=element_blank(),
        axis.title.y = element_text(colour="white",size=10, face="bold",margin=margin(r=15)),
        panel.grid = element_blank(),
        legend.background = element_rect(fill="black"),
        legend.key = element_rect(fill="black"),
        legend.text=element_text(colour="white",margin=margin(l=15),face="bold"),
        legend.key.height = unit(1,"cm"),
        legend.box = "vertical",
        legend.title = element_blank(),
        legend.position = "top",
        plot.title.position = "plot",
        plot.caption.position = "plot",
        plot.title=element_text(size=14, face="bold",colour="white",margin=margin(b=15)),
        plot.subtitle = element_text(size=12, colour="white",margin=margin(b=25)),
        plot.caption=element_text(size=10,colour="white",hjust=0,margin=margin(t=20)))+
  labs(title="CIVIL LIBERTIES DECLINE IN INDIA",
       subtitle=str_wrap("According to data from Freedom House, while political rights continue to stay the same indicating the free status of the country, civil liberties declined in India in 2020. The below graph depicts the ratings for India from 1995-2020 on a scale of 1 to 7, where 1 represents the most free, and 7, the least free status",120),
       caption = "Data from Freedom House and the United Nations by way of Arthur Cheib for Tidy Tuesday| Analysis and design: @annapurani93")+ ylab("-------------RATING--------------")->plot


ggsave("indiafreedom.png",plot,width=11,height=7)
ggsave("indiafreedom.pdf",plot,width=11,height=7)
