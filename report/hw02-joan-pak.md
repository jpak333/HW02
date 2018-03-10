HW02 - Shot Charts
================
Joan Pak

Summary Table
=============

Shooting Distance
=================

``` r
# dplyr table
library(ggplot2)

dis_shot <- dat%>%
  filter(shot_made_flag=="made shot") %>%
  select(shot_distance,shot_made_flag)%>%
  group_by(shot_distance) %>%
  summarize(made_shot=n())
dis_shot
```

    ## # A tibble: 35 x 2
    ##    shot_distance made_shot
    ##            <int>     <int>
    ##  1             0       344
    ##  2             1       262
    ##  3             2       151
    ##  4             3        31
    ##  5             4        23
    ##  6             5        12
    ##  7             6        19
    ##  8             7        17
    ##  9             8        19
    ## 10             9        17
    ## # ... with 25 more rows

``` r
dis <- dat %>%
  select(shot_distance) %>%
  group_by(shot_distance) %>%
  count()
dis <- merge(dis_shot,dis,by="shot_distance")

table1 <- dis %>%
  mutate(made_shot_prop=made_shot/n) %>%
  select(shot_distance,made_shot_prop)
table1
```

    ##    shot_distance made_shot_prop
    ## 1              0      0.8410758
    ## 2              1      0.6683673
    ## 3              2      0.5335689
    ## 4              3      0.3734940
    ## 5              4      0.4107143
    ## 6              5      0.2857143
    ## 7              6      0.3958333
    ## 8              7      0.3953488
    ## 9              8      0.4634146
    ## 10             9      0.3207547
    ## 11            10      0.4642857
    ## 12            11      0.3921569
    ## 13            12      0.5000000
    ## 14            13      0.3692308
    ## 15            14      0.3797468
    ## 16            15      0.4864865
    ## 17            16      0.5327103
    ## 18            17      0.3775510
    ## 19            18      0.5277778
    ## 20            19      0.4077670
    ## 21            20      0.4492754
    ## 22            21      0.5106383
    ## 23            22      0.4901961
    ## 24            23      0.4166667
    ## 25            24      0.4152047
    ## 26            25      0.3857404
    ## 27            26      0.3861893
    ## 28            27      0.4580153
    ## 29            28      0.3088235
    ## 30            29      0.4054054
    ## 31            30      0.5000000
    ## 32            31      0.2666667
    ## 33            32      0.4000000
    ## 34            33      0.4000000
    ## 35            51      1.0000000

``` r
# ggplot
ggplot(data=table1) +
  geom_point(aes(x=shot_distance,y=made_shot_prop))
```

![](../imagesunnamed-chunk-1-1.png)

``` r
# Questions
# The pattern of the dots is similar to a negative exponential graph with one extreme outlier at (50, 1.0).
# The distance and making shots do not seem to have a strong correlation, so it does not matter if the distance it shorter or longer to make more effective shots.
# As we can see at distance 50, the proportion of shots is at 1.0, so if we go beyond, the chance of making a shot becomes a lot smaller. 
# The distances from 0 to 3 tend to have a 50% or more of making the shot. 
```

Total Number of Shots By Minute of Occurrence
=============================================

``` r
shot_min <- dat %>%
  select(name,shot_made_flag,minute) %>%
  filter(shot_made_flag=="made shot") %>%
  group_by(name,minute) %>%
  summarize(shots=n())

rects <- data.frame(xstart=c(1,24),xend=c(12,36),col="grey69")

ggplot(data=shot_min) +
  geom_point(aes(x=minute,y=shots),col="blue") +
  facet_wrap( ~ name, ncol=3) +
  theme_minimal() +
  geom_path(aes(x=minute,y=shots),linejoin="round",lineend="butt",col="blue") +
  scale_x_continuous(breaks=c(1,12,24,36,48)) +
  geom_rect(data=rects,aes(xmin=xstart,xmax=xend,ymin=0,ymax=30,fill=col),alpha=0.4)
```

![](../imagesunnamed-chunk-2-1.png)
