#Individual Task - Week6 
#Create 2 simple  data frames
?data.frame()

country = c("Czechia", "Chile", "China")
capital = c("Prague", "Santiago", "Beijing")
Cap. = data.frame(country1,capital)

country = c("Czechia", "Chile", "Chad")
continent = c("Europe", "America", "Africa")
Cont. = data.frame(country2,continent)

?merge
merge(Cap.,Cont.)

#OR (SHORTCUT)

Cap. = data.frame(country1 = c("Czechia", "Chile", "China"),
               capital = c("Prague", "Santiago", "Beijing"))

Cont. = data.frame(country2 = c("Czechia", "Chile", "Chad"),
                   continent = c("Europe", "America", "Africa"))

merge(Cap.,Cont.)
