---
title: 's05: Some More `dplyr` Exercise'
output: 
  html_document:
    keep_md: true
    theme: paper
---

<!---The following chunk allows errors when knitting--->



**When you make an Rmd file for participation or homework, be sure to do this**:

1. Change the file output to both html and md _documents_ (not notebook).
  - See the `keep_md: TRUE` argument above.

2. `knit` the document. 

3. Stage and commit the Rmd and knitted documents.


# Let's review some `dplyr` syntax

Load the `tidyverse` package.
    

```r
# load your packages here:
library(dplyr)
library(tidyverse)
```
    

## `select()`, `rename()`, `filter()`, `mutate()`, and a little plotting

Let's use the `mtcars` dataset. Complete the following tasks. Chain together
all of the commands in a task using the pipe `%>%`.

1. Show the miles per gallon and horsepower for cars with 6 cylinders. Also
   convert the data frame to a tibble (keep the rownames and store them in the
   tibble with a descriptive variable name). Store this result as a new object
   with a descriptive object name.


```r
new_cars <- as_tibble(mtcars, rownames = "model") %>% 
  filter(cyl == 6) %>% 
  select(model,mpg,hp)
new_cars
```

```
## # A tibble: 7 x 3
##   model            mpg    hp
##   <chr>          <dbl> <dbl>
## 1 Mazda RX4       21     110
## 2 Mazda RX4 Wag   21     110
## 3 Hornet 4 Drive  21.4   110
## 4 Valiant         18.1   105
## 5 Merc 280        19.2   123
## 6 Merc 280C       17.8   123
## 7 Ferrari Dino    19.7   175
```

2. Print the results from Task 1 in an appealing way by using `knitr::kable()`.


```r
knitr::kable(new_cars)
```



model              mpg    hp
---------------  -----  ----
Mazda RX4         21.0   110
Mazda RX4 Wag     21.0   110
Hornet 4 Drive    21.4   110
Valiant           18.1   105
Merc 280          19.2   123
Merc 280C         17.8   123
Ferrari Dino      19.7   175

Let's use the `iris` dataset. Complete the following tasks. Chain together
all of the commands in a task using the pipe `%>%`.

3. Rename the variables to be all lowercase and to separate words with "_"
   instead of ".". Put the species name variable first. Store this result as 
   a new object.


```r
iris_new <- iris


#can use the rename(new_name = old.name) function or select(new_name = old.name)


colnames(iris_new) <- c("sepal_length","sepal_width","petal_length","petal_width","species")

iris_new <- iris_new %>% 
  select(species, everything())
```

4. Using the data from Task 3, plot the sepal width for each species. Perhaps 
   use a boxplot or a jitter plot (or both overlaid!). Be sure to format the
   axis labels nicely.


```r
ggplot(iris_new, aes(x=species,y=sepal_width)) +
  geom_boxplot() +
  geom_jitter()
```

![](s05_SomeMoredplyrExercise_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

5. `iris` expresses all of the measurements in centimeters. Convert them to 
   inches (1 in = 2.54 cm). Store this dataset as a new object.


```r
iris_new <- iris_new %>% 
  mutate(sepal_length_in = sepal_length*0.393701) %>% 
  mutate(sepal_width_in = sepal_width*0.393701) %>% 
  mutate(petal_length_in = petal_length*0.393701) %>% 
  mutate(petal_width_in = petal_width*0.393701)

iris_new
```

```
##        species sepal_length sepal_width petal_length petal_width
## 1       setosa          5.1         3.5          1.4         0.2
## 2       setosa          4.9         3.0          1.4         0.2
## 3       setosa          4.7         3.2          1.3         0.2
## 4       setosa          4.6         3.1          1.5         0.2
## 5       setosa          5.0         3.6          1.4         0.2
## 6       setosa          5.4         3.9          1.7         0.4
## 7       setosa          4.6         3.4          1.4         0.3
## 8       setosa          5.0         3.4          1.5         0.2
## 9       setosa          4.4         2.9          1.4         0.2
## 10      setosa          4.9         3.1          1.5         0.1
## 11      setosa          5.4         3.7          1.5         0.2
## 12      setosa          4.8         3.4          1.6         0.2
## 13      setosa          4.8         3.0          1.4         0.1
## 14      setosa          4.3         3.0          1.1         0.1
## 15      setosa          5.8         4.0          1.2         0.2
## 16      setosa          5.7         4.4          1.5         0.4
## 17      setosa          5.4         3.9          1.3         0.4
## 18      setosa          5.1         3.5          1.4         0.3
## 19      setosa          5.7         3.8          1.7         0.3
## 20      setosa          5.1         3.8          1.5         0.3
## 21      setosa          5.4         3.4          1.7         0.2
## 22      setosa          5.1         3.7          1.5         0.4
## 23      setosa          4.6         3.6          1.0         0.2
## 24      setosa          5.1         3.3          1.7         0.5
## 25      setosa          4.8         3.4          1.9         0.2
## 26      setosa          5.0         3.0          1.6         0.2
## 27      setosa          5.0         3.4          1.6         0.4
## 28      setosa          5.2         3.5          1.5         0.2
## 29      setosa          5.2         3.4          1.4         0.2
## 30      setosa          4.7         3.2          1.6         0.2
## 31      setosa          4.8         3.1          1.6         0.2
## 32      setosa          5.4         3.4          1.5         0.4
## 33      setosa          5.2         4.1          1.5         0.1
## 34      setosa          5.5         4.2          1.4         0.2
## 35      setosa          4.9         3.1          1.5         0.2
## 36      setosa          5.0         3.2          1.2         0.2
## 37      setosa          5.5         3.5          1.3         0.2
## 38      setosa          4.9         3.6          1.4         0.1
## 39      setosa          4.4         3.0          1.3         0.2
## 40      setosa          5.1         3.4          1.5         0.2
## 41      setosa          5.0         3.5          1.3         0.3
## 42      setosa          4.5         2.3          1.3         0.3
## 43      setosa          4.4         3.2          1.3         0.2
## 44      setosa          5.0         3.5          1.6         0.6
## 45      setosa          5.1         3.8          1.9         0.4
## 46      setosa          4.8         3.0          1.4         0.3
## 47      setosa          5.1         3.8          1.6         0.2
## 48      setosa          4.6         3.2          1.4         0.2
## 49      setosa          5.3         3.7          1.5         0.2
## 50      setosa          5.0         3.3          1.4         0.2
## 51  versicolor          7.0         3.2          4.7         1.4
## 52  versicolor          6.4         3.2          4.5         1.5
## 53  versicolor          6.9         3.1          4.9         1.5
## 54  versicolor          5.5         2.3          4.0         1.3
## 55  versicolor          6.5         2.8          4.6         1.5
## 56  versicolor          5.7         2.8          4.5         1.3
## 57  versicolor          6.3         3.3          4.7         1.6
## 58  versicolor          4.9         2.4          3.3         1.0
## 59  versicolor          6.6         2.9          4.6         1.3
## 60  versicolor          5.2         2.7          3.9         1.4
## 61  versicolor          5.0         2.0          3.5         1.0
## 62  versicolor          5.9         3.0          4.2         1.5
## 63  versicolor          6.0         2.2          4.0         1.0
## 64  versicolor          6.1         2.9          4.7         1.4
## 65  versicolor          5.6         2.9          3.6         1.3
## 66  versicolor          6.7         3.1          4.4         1.4
## 67  versicolor          5.6         3.0          4.5         1.5
## 68  versicolor          5.8         2.7          4.1         1.0
## 69  versicolor          6.2         2.2          4.5         1.5
## 70  versicolor          5.6         2.5          3.9         1.1
## 71  versicolor          5.9         3.2          4.8         1.8
## 72  versicolor          6.1         2.8          4.0         1.3
## 73  versicolor          6.3         2.5          4.9         1.5
## 74  versicolor          6.1         2.8          4.7         1.2
## 75  versicolor          6.4         2.9          4.3         1.3
## 76  versicolor          6.6         3.0          4.4         1.4
## 77  versicolor          6.8         2.8          4.8         1.4
## 78  versicolor          6.7         3.0          5.0         1.7
## 79  versicolor          6.0         2.9          4.5         1.5
## 80  versicolor          5.7         2.6          3.5         1.0
## 81  versicolor          5.5         2.4          3.8         1.1
## 82  versicolor          5.5         2.4          3.7         1.0
## 83  versicolor          5.8         2.7          3.9         1.2
## 84  versicolor          6.0         2.7          5.1         1.6
## 85  versicolor          5.4         3.0          4.5         1.5
## 86  versicolor          6.0         3.4          4.5         1.6
## 87  versicolor          6.7         3.1          4.7         1.5
## 88  versicolor          6.3         2.3          4.4         1.3
## 89  versicolor          5.6         3.0          4.1         1.3
## 90  versicolor          5.5         2.5          4.0         1.3
## 91  versicolor          5.5         2.6          4.4         1.2
## 92  versicolor          6.1         3.0          4.6         1.4
## 93  versicolor          5.8         2.6          4.0         1.2
## 94  versicolor          5.0         2.3          3.3         1.0
## 95  versicolor          5.6         2.7          4.2         1.3
## 96  versicolor          5.7         3.0          4.2         1.2
## 97  versicolor          5.7         2.9          4.2         1.3
## 98  versicolor          6.2         2.9          4.3         1.3
## 99  versicolor          5.1         2.5          3.0         1.1
## 100 versicolor          5.7         2.8          4.1         1.3
## 101  virginica          6.3         3.3          6.0         2.5
## 102  virginica          5.8         2.7          5.1         1.9
## 103  virginica          7.1         3.0          5.9         2.1
## 104  virginica          6.3         2.9          5.6         1.8
## 105  virginica          6.5         3.0          5.8         2.2
## 106  virginica          7.6         3.0          6.6         2.1
## 107  virginica          4.9         2.5          4.5         1.7
## 108  virginica          7.3         2.9          6.3         1.8
## 109  virginica          6.7         2.5          5.8         1.8
## 110  virginica          7.2         3.6          6.1         2.5
## 111  virginica          6.5         3.2          5.1         2.0
## 112  virginica          6.4         2.7          5.3         1.9
## 113  virginica          6.8         3.0          5.5         2.1
## 114  virginica          5.7         2.5          5.0         2.0
## 115  virginica          5.8         2.8          5.1         2.4
## 116  virginica          6.4         3.2          5.3         2.3
## 117  virginica          6.5         3.0          5.5         1.8
## 118  virginica          7.7         3.8          6.7         2.2
## 119  virginica          7.7         2.6          6.9         2.3
## 120  virginica          6.0         2.2          5.0         1.5
## 121  virginica          6.9         3.2          5.7         2.3
## 122  virginica          5.6         2.8          4.9         2.0
## 123  virginica          7.7         2.8          6.7         2.0
## 124  virginica          6.3         2.7          4.9         1.8
## 125  virginica          6.7         3.3          5.7         2.1
## 126  virginica          7.2         3.2          6.0         1.8
## 127  virginica          6.2         2.8          4.8         1.8
## 128  virginica          6.1         3.0          4.9         1.8
## 129  virginica          6.4         2.8          5.6         2.1
## 130  virginica          7.2         3.0          5.8         1.6
## 131  virginica          7.4         2.8          6.1         1.9
## 132  virginica          7.9         3.8          6.4         2.0
## 133  virginica          6.4         2.8          5.6         2.2
## 134  virginica          6.3         2.8          5.1         1.5
## 135  virginica          6.1         2.6          5.6         1.4
## 136  virginica          7.7         3.0          6.1         2.3
## 137  virginica          6.3         3.4          5.6         2.4
## 138  virginica          6.4         3.1          5.5         1.8
## 139  virginica          6.0         3.0          4.8         1.8
## 140  virginica          6.9         3.1          5.4         2.1
## 141  virginica          6.7         3.1          5.6         2.4
## 142  virginica          6.9         3.1          5.1         2.3
## 143  virginica          5.8         2.7          5.1         1.9
## 144  virginica          6.8         3.2          5.9         2.3
## 145  virginica          6.7         3.3          5.7         2.5
## 146  virginica          6.7         3.0          5.2         2.3
## 147  virginica          6.3         2.5          5.0         1.9
## 148  virginica          6.5         3.0          5.2         2.0
## 149  virginica          6.2         3.4          5.4         2.3
## 150  virginica          5.9         3.0          5.1         1.8
##     sepal_length_in sepal_width_in petal_length_in petal_width_in
## 1          2.007875      1.3779535       0.5511814      0.0787402
## 2          1.929135      1.1811030       0.5511814      0.0787402
## 3          1.850395      1.2598432       0.5118113      0.0787402
## 4          1.811025      1.2204731       0.5905515      0.0787402
## 5          1.968505      1.4173236       0.5511814      0.0787402
## 6          2.125985      1.5354339       0.6692917      0.1574804
## 7          1.811025      1.3385834       0.5511814      0.1181103
## 8          1.968505      1.3385834       0.5905515      0.0787402
## 9          1.732284      1.1417329       0.5511814      0.0787402
## 10         1.929135      1.2204731       0.5905515      0.0393701
## 11         2.125985      1.4566937       0.5905515      0.0787402
## 12         1.889765      1.3385834       0.6299216      0.0787402
## 13         1.889765      1.1811030       0.5511814      0.0393701
## 14         1.692914      1.1811030       0.4330711      0.0393701
## 15         2.283466      1.5748040       0.4724412      0.0787402
## 16         2.244096      1.7322844       0.5905515      0.1574804
## 17         2.125985      1.5354339       0.5118113      0.1574804
## 18         2.007875      1.3779535       0.5511814      0.1181103
## 19         2.244096      1.4960638       0.6692917      0.1181103
## 20         2.007875      1.4960638       0.5905515      0.1181103
## 21         2.125985      1.3385834       0.6692917      0.0787402
## 22         2.007875      1.4566937       0.5905515      0.1574804
## 23         1.811025      1.4173236       0.3937010      0.0787402
## 24         2.007875      1.2992133       0.6692917      0.1968505
## 25         1.889765      1.3385834       0.7480319      0.0787402
## 26         1.968505      1.1811030       0.6299216      0.0787402
## 27         1.968505      1.3385834       0.6299216      0.1574804
## 28         2.047245      1.3779535       0.5905515      0.0787402
## 29         2.047245      1.3385834       0.5511814      0.0787402
## 30         1.850395      1.2598432       0.6299216      0.0787402
## 31         1.889765      1.2204731       0.6299216      0.0787402
## 32         2.125985      1.3385834       0.5905515      0.1574804
## 33         2.047245      1.6141741       0.5905515      0.0393701
## 34         2.165355      1.6535442       0.5511814      0.0787402
## 35         1.929135      1.2204731       0.5905515      0.0787402
## 36         1.968505      1.2598432       0.4724412      0.0787402
## 37         2.165355      1.3779535       0.5118113      0.0787402
## 38         1.929135      1.4173236       0.5511814      0.0393701
## 39         1.732284      1.1811030       0.5118113      0.0787402
## 40         2.007875      1.3385834       0.5905515      0.0787402
## 41         1.968505      1.3779535       0.5118113      0.1181103
## 42         1.771655      0.9055123       0.5118113      0.1181103
## 43         1.732284      1.2598432       0.5118113      0.0787402
## 44         1.968505      1.3779535       0.6299216      0.2362206
## 45         2.007875      1.4960638       0.7480319      0.1574804
## 46         1.889765      1.1811030       0.5511814      0.1181103
## 47         2.007875      1.4960638       0.6299216      0.0787402
## 48         1.811025      1.2598432       0.5511814      0.0787402
## 49         2.086615      1.4566937       0.5905515      0.0787402
## 50         1.968505      1.2992133       0.5511814      0.0787402
## 51         2.755907      1.2598432       1.8503947      0.5511814
## 52         2.519686      1.2598432       1.7716545      0.5905515
## 53         2.716537      1.2204731       1.9291349      0.5905515
## 54         2.165355      0.9055123       1.5748040      0.5118113
## 55         2.559057      1.1023628       1.8110246      0.5905515
## 56         2.244096      1.1023628       1.7716545      0.5118113
## 57         2.480316      1.2992133       1.8503947      0.6299216
## 58         1.929135      0.9448824       1.2992133      0.3937010
## 59         2.598427      1.1417329       1.8110246      0.5118113
## 60         2.047245      1.0629927       1.5354339      0.5511814
## 61         1.968505      0.7874020       1.3779535      0.3937010
## 62         2.322836      1.1811030       1.6535442      0.5905515
## 63         2.362206      0.8661422       1.5748040      0.3937010
## 64         2.401576      1.1417329       1.8503947      0.5511814
## 65         2.204726      1.1417329       1.4173236      0.5118113
## 66         2.637797      1.2204731       1.7322844      0.5511814
## 67         2.204726      1.1811030       1.7716545      0.5905515
## 68         2.283466      1.0629927       1.6141741      0.3937010
## 69         2.440946      0.8661422       1.7716545      0.5905515
## 70         2.204726      0.9842525       1.5354339      0.4330711
## 71         2.322836      1.2598432       1.8897648      0.7086618
## 72         2.401576      1.1023628       1.5748040      0.5118113
## 73         2.480316      0.9842525       1.9291349      0.5905515
## 74         2.401576      1.1023628       1.8503947      0.4724412
## 75         2.519686      1.1417329       1.6929143      0.5118113
## 76         2.598427      1.1811030       1.7322844      0.5511814
## 77         2.677167      1.1023628       1.8897648      0.5511814
## 78         2.637797      1.1811030       1.9685050      0.6692917
## 79         2.362206      1.1417329       1.7716545      0.5905515
## 80         2.244096      1.0236226       1.3779535      0.3937010
## 81         2.165355      0.9448824       1.4960638      0.4330711
## 82         2.165355      0.9448824       1.4566937      0.3937010
## 83         2.283466      1.0629927       1.5354339      0.4724412
## 84         2.362206      1.0629927       2.0078751      0.6299216
## 85         2.125985      1.1811030       1.7716545      0.5905515
## 86         2.362206      1.3385834       1.7716545      0.6299216
## 87         2.637797      1.2204731       1.8503947      0.5905515
## 88         2.480316      0.9055123       1.7322844      0.5118113
## 89         2.204726      1.1811030       1.6141741      0.5118113
## 90         2.165355      0.9842525       1.5748040      0.5118113
## 91         2.165355      1.0236226       1.7322844      0.4724412
## 92         2.401576      1.1811030       1.8110246      0.5511814
## 93         2.283466      1.0236226       1.5748040      0.4724412
## 94         1.968505      0.9055123       1.2992133      0.3937010
## 95         2.204726      1.0629927       1.6535442      0.5118113
## 96         2.244096      1.1811030       1.6535442      0.4724412
## 97         2.244096      1.1417329       1.6535442      0.5118113
## 98         2.440946      1.1417329       1.6929143      0.5118113
## 99         2.007875      0.9842525       1.1811030      0.4330711
## 100        2.244096      1.1023628       1.6141741      0.5118113
## 101        2.480316      1.2992133       2.3622060      0.9842525
## 102        2.283466      1.0629927       2.0078751      0.7480319
## 103        2.795277      1.1811030       2.3228359      0.8267721
## 104        2.480316      1.1417329       2.2047256      0.7086618
## 105        2.559057      1.1811030       2.2834658      0.8661422
## 106        2.992128      1.1811030       2.5984266      0.8267721
## 107        1.929135      0.9842525       1.7716545      0.6692917
## 108        2.874017      1.1417329       2.4803163      0.7086618
## 109        2.637797      0.9842525       2.2834658      0.7086618
## 110        2.834647      1.4173236       2.4015761      0.9842525
## 111        2.559057      1.2598432       2.0078751      0.7874020
## 112        2.519686      1.0629927       2.0866153      0.7480319
## 113        2.677167      1.1811030       2.1653555      0.8267721
## 114        2.244096      0.9842525       1.9685050      0.7874020
## 115        2.283466      1.1023628       2.0078751      0.9448824
## 116        2.519686      1.2598432       2.0866153      0.9055123
## 117        2.559057      1.1811030       2.1653555      0.7086618
## 118        3.031498      1.4960638       2.6377967      0.8661422
## 119        3.031498      1.0236226       2.7165369      0.9055123
## 120        2.362206      0.8661422       1.9685050      0.5905515
## 121        2.716537      1.2598432       2.2440957      0.9055123
## 122        2.204726      1.1023628       1.9291349      0.7874020
## 123        3.031498      1.1023628       2.6377967      0.7874020
## 124        2.480316      1.0629927       1.9291349      0.7086618
## 125        2.637797      1.2992133       2.2440957      0.8267721
## 126        2.834647      1.2598432       2.3622060      0.7086618
## 127        2.440946      1.1023628       1.8897648      0.7086618
## 128        2.401576      1.1811030       1.9291349      0.7086618
## 129        2.519686      1.1023628       2.2047256      0.8267721
## 130        2.834647      1.1811030       2.2834658      0.6299216
## 131        2.913387      1.1023628       2.4015761      0.7480319
## 132        3.110238      1.4960638       2.5196864      0.7874020
## 133        2.519686      1.1023628       2.2047256      0.8661422
## 134        2.480316      1.1023628       2.0078751      0.5905515
## 135        2.401576      1.0236226       2.2047256      0.5511814
## 136        3.031498      1.1811030       2.4015761      0.9055123
## 137        2.480316      1.3385834       2.2047256      0.9448824
## 138        2.519686      1.2204731       2.1653555      0.7086618
## 139        2.362206      1.1811030       1.8897648      0.7086618
## 140        2.716537      1.2204731       2.1259854      0.8267721
## 141        2.637797      1.2204731       2.2047256      0.9448824
## 142        2.716537      1.2204731       2.0078751      0.9055123
## 143        2.283466      1.0629927       2.0078751      0.7480319
## 144        2.677167      1.2598432       2.3228359      0.9055123
## 145        2.637797      1.2992133       2.2440957      0.9842525
## 146        2.637797      1.1811030       2.0472452      0.9055123
## 147        2.480316      0.9842525       1.9685050      0.7480319
## 148        2.559057      1.1811030       2.0472452      0.7874020
## 149        2.440946      1.3385834       2.1259854      0.9055123
## 150        2.322836      1.1811030       2.0078751      0.7086618
```

6. Using the data from Task 5, plot the relationship between sepal width and
   sepal length. Indicate species using color and point shape.


```r
ggplot(iris_new, aes(x=sepal_width,y=sepal_length)) +
  geom_point(aes(color = species, shape = species))
```

![](s05_SomeMoredplyrExercise_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

7. Using the data from Task 5, plot the relationship between sepal width and
   sepal length. This time, separate each species into a different subplot 
   (facet).


```r
ggplot(iris_new, aes(x=sepal_width,y=sepal_length)) +
  geom_point(aes(color = species, shape = species)) +
  facet_wrap(~species)
```

![](s05_SomeMoredplyrExercise_files/figure-html/unnamed-chunk-7-1.png)<!-- -->


# Back to Guide Again

Let's head back to the guide at the section on `summarize()`.


# Exercises for grouped data frames

Let's do some practice with grouping (and ungrouping) and summarizing data frames!

1. (a) What's the minimum life expectancy for each continent and each year? 
   (b) Add the corresponding country to the tibble, too. 
   (c) Arrange by min life expectancy.


```r
library(gapminder)
gapminder %>% 
  group_by(continent, year) %>% 
  summarise(min_life = min(lifeExp)) %>% 
  arrange(min_life)
```

```
## # A tibble: 60 x 3
## # Groups:   continent [5]
##    continent  year min_life
##    <fct>     <int>    <dbl>
##  1 Africa     1992     23.6
##  2 Asia       1952     28.8
##  3 Africa     1952     30  
##  4 Asia       1957     30.3
##  5 Asia       1977     31.2
##  6 Africa     1957     31.6
##  7 Asia       1962     32.0
##  8 Africa     1962     32.8
##  9 Asia       1967     34.0
## 10 Africa     1967     34.1
## # … with 50 more rows
```


2. Let's compute the mean Agreeableness score across items for each participant 
in the `psych::bfi` dataset. Be sure to handle `NA`!


```r
psych::bfi %>%
  as_tibble() %>% 
  select(A1:A5) %>% 
  rowwise() %>% 
  mutate(A_mean = mean(c(A1, A2, A3, A4, A5), na.rm = TRUE),
         A_sd = sd(c(A1, A2, A3, A4, A5), na.rm = TRUE)) %>% 
  ungroup()
```

```
## # A tibble: 2,800 x 7
##       A1    A2    A3    A4    A5 A_mean  A_sd
##    <int> <int> <int> <int> <int>  <dbl> <dbl>
##  1     2     4     3     4     4    3.4 0.894
##  2     2     4     5     2     5    3.6 1.52 
##  3     5     4     5     4     4    4.4 0.548
##  4     4     4     6     5     5    4.8 0.837
##  5     2     3     3     4     5    3.4 1.14 
##  6     6     6     5     6     5    5.6 0.548
##  7     2     5     5     3     5    4   1.41 
##  8     4     3     1     5     1    2.8 1.79 
##  9     4     3     6     3     3    3.8 1.30 
## 10     2     5     6     6     5    4.8 1.64 
## # … with 2,790 more rows
```

Now compute mean scores for Conscientiousness, as well as `sd` and `min` scores 
for reach person.


```r
psych::bfi %>%
  as_tibble() %>% 
  select(C1:C5) %>% 
  rowwise() %>% 
  mutate(A_mean = mean(c(C1, C2, C3, C4, C5), na.rm = TRUE),
         A_sd = sd(c(C1, A2, A3, A4, A5), na.rm = TRUE)) %>% 
  ungroup()
```

```
## Error in is.data.frame(x): object 'A2' not found
```

Some functions are **vectorized**, so you don't need `rowwise()`. 
For example, `pmin()` computes the "parallel min" across the vectors it receives:


```r
psych::bfi %>% 
  as_tibble() %>% 
  select(A1:A5) %>% 
  mutate(A_min = pmin(A1, A2, A3, A4, A5))
```

```
## # A tibble: 2,800 x 6
##       A1    A2    A3    A4    A5 A_min
##    <int> <int> <int> <int> <int> <int>
##  1     2     4     3     4     4     2
##  2     2     4     5     2     5     2
##  3     5     4     5     4     4     4
##  4     4     4     6     5     5     4
##  5     2     3     3     4     5     2
##  6     6     6     5     6     5     5
##  7     2     5     5     3     5     2
##  8     4     3     1     5     1     1
##  9     4     3     6     3     3     3
## 10     2     5     6     6     5     2
## # … with 2,790 more rows
```

**There are a few other ways to do this sort of computation.**

`rowMeans()` computes the mean of each row of a data frame. We can use it by
putting `select()` inside of `mutate()`:



```r
psych::bfi %>% 
  as_tibble() %>% 
  select(A1:A5) %>% 
  mutate(A_mn = rowMeans(select(., A1:A5)),
         A_mn2 = rowMeans(select(., starts_with("A", ignore.case = FALSE))))
```

```
## # A tibble: 2,800 x 7
##       A1    A2    A3    A4    A5  A_mn A_mn2
##    <int> <int> <int> <int> <int> <dbl> <dbl>
##  1     2     4     3     4     4   3.4   3.4
##  2     2     4     5     2     5   3.6   3.6
##  3     5     4     5     4     4   4.4   4.4
##  4     4     4     6     5     5   4.8   4.8
##  5     2     3     3     4     5   3.4   3.4
##  6     6     6     5     6     5   5.6   5.6
##  7     2     5     5     3     5   4     4  
##  8     4     3     1     5     1   2.8   2.8
##  9     4     3     6     3     3   3.8   3.8
## 10     2     5     6     6     5   4.8   4.8
## # … with 2,790 more rows
```

**In the development version of `dplyr`, there are some functions to make**
**this approach easier.**

```
remotes::install_github("tidyverse/dplyr")
```


```r
psych::bfi %>% 
  as_tibble() %>% 
  select(A1:A5) %>% 
  mutate(A_mn = rowMeans(across(A1:A5)),
         A_mn2 = rowMeans(across(starts_with("A", ignore.case = FALSE))))
```

3. Let's use `psych::bfi` and make a new data frame that has
   (1) each participant's educational level (convert it to a categorical variable
   using `factor*()`) and the mean score for each of the Big Five scales for each 
   participant. Store this data frame as a new object.
   

```r
edu_level <-
psych::bfi %>%
  as_tibble() %>% 
  select(C1:C5) %>% 
  rowwise() %>% 
  mutate(A_mean = mean(c(C1, C2, C3, C4, C5), na.rm = TRUE),
         A_sd = sd(c(C1, C2, C3, C4, C5), na.rm = TRUE)) %>% 
  ungroup()
```

4. Use the data from Task 3 to summarize the distributions of Big Five scores 
   for each educational level (e.g., report the mean, sd, min, and max for
   each score in each group). Also report the sample size within each group.
   

```r
FILL_THIS_IN %>% 
  FILL_THIS_IN(FILL_THIS_IN) %>% 
  FILL_THIS_IN(FILL_THIS_IN)
```

```
## Error in eval(lhs, parent, parent): object 'FILL_THIS_IN' not found
```



# Bonus Exercises

1. In `gapminder`, take all countries in Europe that have a GDP per capita 
   greater than 10000, and select all variables except `gdpPercap`. 
   (Hint: use `-`).

2. Take the first three columns of `gapminder` and extract the names.

3. In `gapminder`, convert the population to a number in billions.

4. Take the `iris` data frame and extract all columns that start with 
   the word "Petal". 
    - Hint: take a look at the "Select helpers" documentation by running the 
      following code: `?tidyselect::select_helpers`.

5. Filter the rows of `iris` for Sepal.Length >= 4.6 and Petal.Width >= 0.5.

6. Calculate the growth in population since the first year on record 
_for each country_ by rearranging the following lines, and filling in the 
`FILL_THIS_IN`. Here's another convenience function for you: `dplyr::first()`. 

```
mutate(rel_growth = FILL_THIS_IN) %>% 
arrange(FILL_THIS_IN) %>% 
gapminder %>% 
knitr::kable()
group_by(country) %>% 
```




7. Determine the country, on each continent, that experienced the 
**sharpest 5-year drop in life expectancy**, sorted by the drop, by rearranging 
the following lines of code. Ensure there are no `NA`'s. A helpful function to 
compute changes in a variable across rows of data (e.g., for time-series data) 
is `tsibble::difference()`:

```
drop_na() %>% 
ungroup() %>% 
arrange(year) %>% 
filter(inc_life_exp == min(inc_life_exp)) %>% 
gapminder %>% 
mutate(inc_life_exp = FILL_THIS_IN) %>% # Compute the changes in life expectancy
arrange(inc_life_exp) %>% 
group_by(country) %>% 
group_by(continent) %>% 
knitr::kable()
```



Exercises 4. and 5. are from 
[r-exercises](https://www.r-exercises.com/2017/10/19/dplyr-basic-functions-exercises/).
