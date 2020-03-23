---
title: "s09 Exercises: Factors"
output: 
  html_document:
    keep_md: true
    theme: paper
---



## Motivating the need for factors in R

### Activity 1: Using factors for plotting 

**1.1** Let's look again into `gapminder` dataset and create a new cloumn, 
`life_level`, that contains five categories ("very high", "high","moderate", 
"low", "very low") based on life expectancy in 1997. Assign categories accoring 
to the table below:

| Criteria | life_level| 
|-------------|-----------|
| less than 23 | very low |
| between 23 and 48 | low |
| between 48 and 59 | moderate |
| between 59 and 70 | high |
| more than 70 | very high |

Function `case_when()` is a tidier way to vectorise multiple `if_else()` statements. 
You can read more about this function [here](https://dplyr.tidyverse.org/reference/case_when.html).


```r
gapminder %>% 
  filter(year == FILL_IN_THIS) %>% 
  mutate(life_level = case_when(lifeExp < FILL_IN_THIS ~ FILL_IN_THIS,
                                lifeExp < FILL_IN_THIS ~ FILL_IN_THIS,
                                lifeExp < FILL_IN_THIS ~ FILL_IN_THIS,
                                lifeExp < FILL_IN_THIS ~ FILL_IN_THIS,
                                # else
                                TRUE ~ FILL_IN_THIS)) %>% 
  ggplot() + 
  geom_boxplot(aes(x = FILL_IN_THIS, y = FILL_IN_THIS)) +
  labs(y = "GDP per capita, $", x = "Life expectancy level, years") +
  theme_bw() 
```

```
## Error in gapminder %>% filter(year == FILL_IN_THIS) %>% mutate(life_level = case_when(lifeExp < : could not find function "%>%"
```

Do you notice anything odd/wrong about the graph?

We can make a few observations:

- It seems that none of the countries had a "very low" life-expectancy in 1997. 

- However, since it was an option in our analysis it should be included in our plot. Right?

- Notice also how levels on x-axis are placed in the "wrong" order.

**1.2** You can correct these issues by explicitly setting the levels parameter 
in the call to `factor()`. Use, `drop = FALSE` to tell the plot not to drop 
unused levels.


```r
gapminder %>% 
  filter(year == FILL_IN_THIS) %>% 
  mutate(life_level = case_when(lifeExp < FILL_IN_THIS ~ FILL_IN_THIS,
                                lifeExp < FILL_IN_THIS ~ FILL_IN_THIS,
                                lifeExp < FILL_IN_THIS ~ FILL_IN_THIS,
                                lifeExp < FILL_IN_THIS ~ FILL_IN_THIS,
                                # else
                                TRUE ~ FILL_IN_THIS) ,
                      levels = FILL_IN_THIS)) %>% %>% 
  ggplot() + 
  geom_boxplot(aes(x = FILL_IN_THIS, y = FILL_IN_THIS)) +
  labs(y = "GDP per capita, $", x = "Life expectancy level, years") +
  theme_bw() 
```

```
## Error: <text>:9:45: unexpected ')'
## 8:                                 TRUE ~ FILL_IN_THIS) ,
## 9:                       levels = FILL_IN_THIS))
##                                                ^
```

## Activity 2: Inspecting factors

In Activity 1, we created our own factors, so now let's explore what 
categorical variables that we have in the `gapminder` dataset.

### **2.1** Exploring `gapminder$continent`

Use functions such as `str()`, `levels()`, `nlevels()` and `class()` to 
answer the following questions:

- What class (type of object) is `continent` (a factor or character)?
- How many levels? What are they?
- What integer is used to represent factor "Asia"?



### **2.2** Exploring `gapminder$country`

Let's explore what else we can do with factors. Answer the following questions: 

- How many levels are there in `country`?
- Filter `gapminder` dataset by 5 countries of your choice. How many levels are 
  in your filtered dataset?



## Dropping unused levels

What if we want to get rid of some levels that are "unused" -- how do we do that? 

The function `droplevels()` operates on all the factors in a data frame or on a 
single factor. The function `forcats::fct_drop()` operates on a factor and does 
not drop `NA` values.


```r
h_gap_dropped <- FILL_IN_THIS %>% 
  droplevels()
```

```
## Error in FILL_IN_THIS %>% droplevels(): could not find function "%>%"
```

## Changing the order of levels

Let's say we wanted to re-order the levels of a factor using a new metric - say, count().

We should first produce a frequency table as a tibble using `dplyr::count()`:



The table is nice, but it would be better to visualize the data.
Factors are most useful/helpful when plotting data.
So let's first plot this:


```r
FILL_IN_THIS %>%
  ggplot() +
  geom_bar(aes(FILL_IN_THIS)) +
  coord_flip() +
  theme_bw() +
  ylab("Number of entries") + xlab("Continent")
```

```
## Error in FILL_IN_THIS %>% ggplot(): could not find function "%>%"
```

Think about how levels are normally ordered. 
It turns out that by default, R always sorts levels in alphabetical order. 
However, it is often preferable to order the levels according to some principle:

  1. Frequency/count (`fct_infreq()`)
  2. Order of appearance (`fct_inorder()`)
  3. Sequence of the underlying integers (`fct_inseq()`)
  
- Make the most common level the first and so on. Function like `fct_infreq()` 
  might be useful.
- The function `fct_rev()` will sort them in the opposite order.


```r
gapminder %>%
  ggplot() +
  geom_bar(aes(FILL_IN_THIS)) +
  coord_flip() +
  theme_bw() +
  ylab("Number of entries") + xlab("Continent")
```

```
## Error in gapminder %>% ggplot(): could not find function "%>%"
```

Section 9.6 of Jenny Bryan's [notes](https://stat545.com/factors-boss.html#reorder-factors) has some helpful examples.

  4. Another variable. 
  
  - For example, if we wanted to bring back our example of ordering `gapminder` 
    countries by life expectancy, we can visualize the results using `fct_reorder()`. 


```r
##  default summarizing function is median()
gapminder %>%
  ggplot() +
  geom_bar(aes(FILL_IN_THIS)) +
  coord_flip() +
  theme_bw() +
  xlab("Continent") + ylab("Number of entries") 
```

```
## Error in gapminder %>% ggplot(): could not find function "%>%"
```

Use `fct_reorder2()` when you have a line chart of a quantitative x against 
another quantitative y and your factor provides the color. 


```r
## order by life expectancy 
ggplot(h_gap, aes(x = year, y = lifeExp,
                  color = FILL_IN_THIS)) +
  geom_line() +
  labs(color = "Country")
```

```
## Error in ggplot(h_gap, aes(x = year, y = lifeExp, color = FILL_IN_THIS)): could not find function "ggplot"
```

## Change order of the levels manually

This might be useful if you are preparing a report for say, the state of affairs 
in Africa.


```r
gapminder %>%
  ggplot() +
  geom_bar(aes(FILL_IN_THIS)) +
  coord_flip()+
  theme_bw() 
```

```
## Error in gapminder %>% ggplot(): could not find function "%>%"
```

More details on reordering factor levels by hand can be found 
[here](https://forcats.tidyverse.org/reference/fct_relevel.html).

## Recoding factors

Sometimes you want to specify what the levels of a factor should be.
For instance, if you had levels called "blk" and "brwn", you would rather they 
be called "Black" and "Brown" -- this is called recoding.

Lets recode `Oceania` and the `Americas` in the graph above as abbreviations 
`OCN` and `AME` respectively using the function `fct_recode()`.



## Grow a factor (OPTIONAL)

Let’s create two data frames,`df1` and `df2` each with data from two countries, 
dropping unused factor levels.



The country factors in `df1` and `df2` have different levels.
Can you just combine them using `c()`?



Use `fct_c()` to perform `c()`, but also combine the levels of the two factor
variables:



Explore how different forms of row binding work behave here, in terms of the 
country variable in the result. 

