if(!require(pacman)) install.packages("pacman")
library(pacman)

pacman::p_load(dplyr, car, rstatix, lmtest, ggpubr,
               QuantPsyc, psych, scatterplot3d)

library(readr)
datafacebook <- read_csv("TCCR/datafacebook.csv", 
                         col_types = cols(...1 = col_skip(), Dia = col_date(format = "%Y-%m-%d"), 
                                          Alcance = col_integer(), Impressoes = col_integer(), 
                                          Cliques = col_integer(), Resultados = col_number()))
datagoogle <- read_csv("TCCR/datagoogle.csv", 
                       col_types = cols(...1 = col_skip(), Dia = col_date(format = "%Y-%m-%d"), 
                                        Impressoes = col_integer()))
datapinterest <- read_csv("TCCR/datapinterest.csv", 
                          col_types = cols(...1 = col_skip(), Dia = col_date(format = "%Y-%m-%d"), 
                                           Alcance = col_integer(), Impressoes = col_integer(), 
                                           Cliques = col_integer(), Conversões = col_integer(), 
                                           Resultados = col_integer()))
datatiktok <- read_csv("TCCR/datatiktok.csv", 
                       col_types = cols(...1 = col_skip(), Dia = col_date(format = "%Y-%m-%d"), 
                                        Alcance = col_integer(), Cliques = col_integer(), 
                                        Conversões = col_integer()))

dataModelo1a <- read_csv("TCCR/dataModelo1a.csv", 
                         col_types = cols(...1 = col_skip(), Dia = col_date(format = "%Y-%m-%d")))

dataModelo1b <- read_csv("TCCR/dataModelo1b.csv", 
                         col_types = cols(...1 = col_skip(), Dia = col_date(format = "%Y-%m-%d")))

dataModelo2a <- read_csv("TCCR/dataModelo2a.csv", 
                         col_types = cols(...1 = col_skip(), Dia = col_date(format = "%Y-%m-%d")))

dataModelo2b <- read_csv("TCCR/dataModelo2b.csv", 
                         col_types = cols(...1 = col_skip(), Dia = col_date(format = "%Y-%m-%d"), 
                                          Impressoes = col_number(), Cliques = col_number()))




colnames(datagoogle)
colnames(datafacebook)
colnames(datapinterest)
colnames(datatiktok)
colnames(dataModelo1a)
colnames(dataModelo1b)
colnames(dataModelo2a)
colnames(dataModelo2b)


## Construção do modelo:
modgoogle <- lm(`Faturamento Total` ~ Impressoes  + Cliques +Custo , datagoogle)
modfacebook <- lm(`Faturamento Total` ~ Impressoes    + Cliques   +Custo , datafacebook)
modtiktok <- lm(`Faturamento Total` ~  Impressoes  + Cliques +Custo , datatiktok)
modpinterest <- lm(`Faturamento Total` ~   Impressoes  + Cliques  +Custo , datapinterest)

mod1a <- lm(`Faturamento Total` ~   Impressoes_facebook + Cliques_facebook + Custo_facebook + Impressoes_google + Cliques_google +  Custo_google +  Impressoes_tiktok + Cliques_tiktok +  Custo_tiktok + Impressoes_pinterest + Cliques_pinterest +  Custo_pinterest , dataModelo1a)
mod1b <- lm(`Faturamento Total` ~   Impressoes_facebook + Cliques_facebook +  Custo_facebook + Impressoes_google + Cliques_google + Custo_google , dataModelo1b)
mod2a <- lm(`Faturamento Total` ~  Impressoes + Cliques +  Custo , dataModelo2a)
mod2b <- lm(`Faturamento Total` ~  Impressoes + Cliques +  Custo , dataModelo2b)



## Ausência de Multicolinearidade

pairs.panels(dataModelo1a)
### Multicolinearidade: r > 0.9 (ou 0.8)

vif(mod1a)
### Multicolinearidade: VIF > 10

pairs.panels(dataModelo1b)
### Multicolinearidade: r > 0.9 (ou 0.8)

vif(mod1b)
### Multicolinearidade: VIF > 10

pairs.panels(dataModelo2a)
### Multicolinearidade: r > 0.9 (ou 0.8)

vif(mod2a)
### Multicolinearidade: VIF > 10

pairs.panels(dataModelo2b)
### Multicolinearidade: r > 0.9 (ou 0.8)

vif(mod2b)
### Multicolinearidade: VIF > 10

pairs.panels(datagoogle)
### Multicolinearidade: r > 0.9 (ou 0.8)

vif(modgoogle)
### Multicolinearidade: VIF > 10

pairs.panels(datafacebook)
### Multicolinearidade: r > 0.9 (ou 0.8)

vif(modfacebook)
### Multicolinearidade: VIF > 10

pairs.panels(datatiktok)
### Multicolinearidade: r > 0.9 (ou 0.8)

vif(modtiktok)
### Multicolinearidade: VIF > 10

pairs.panels(datapinterest)
### Multicolinearidade: r > 0.9 (ou 0.8)

vif(modpinterest)
### Multicolinearidade: VIF > 10

summary(modpinterest)
summary(modtiktok)
summary(modfacebook)
summary(modgoogle)

summary(mod1a)
summary(mod1b)
summary(mod2a)
summary(mod2b)


#Reformulando Modelo 2-b
mod2br <- lm(`Faturamento Total` ~  Impressoes  + Cliques +CTR +CPM +CPC  , dataModelo2b)
pairs.panels(dataModelo2b)
### Multicolinearidade: r > 0.9 (ou 0.8)

vif(mod2br)
### Multicolinearidade: VIF > 10


## Análise gráfica:
par(mfrow=c(2,2))

plot(mod2br)

par(mfrow=c(1,1))

## Normalidade dos resíduos:
shapiro.test(mod2br$residuals)
#Noraml p>=0,05

## Outliers nos resíduos:
summary(rstandard(mod2br))


## Independência dos resíduos (Durbin-Watson):
durbinWatsonTest(mod2br)


## Homocedasticidade (Breusch-Pagan):
bptest(mod2br)

# Passo 4: Análise do modelo
summary(mod2br)
summary(mod2b)


## Obtenção dos coeficientes padronizados
lm.beta(mod2br)
lm.beta(mod2b)


## Obtenção do IC 95% para os coeficientes
confint(mod2br)
confint(mod2b)


# Comparação de modelos

## AIC e BIC - Comparação entre quaisquer modelos
AIC(mod2br, mod2b)
BIC(mod2br, mod2b)


## Para comparação entre modelos aninhados

anova(mod2br, mod2b)

### O melhor será o com menor valor de RSS (residual sum of squares)
mod2brr <- lm(`Faturamento Total` ~  Impressoes  + Cliques +CTR  , dataModelo2b)

pairs.panels(dataModelo2b)
### Multicolinearidade: r > 0.9 (ou 0.8)

vif(mod2brr)
### Multicolinearidade: VIF > 10


## Análise gráfica:
par(mfrow=c(2,2))

plot(mod2brr)

par(mfrow=c(1,1))

## Normalidade dos resíduos:
shapiro.test(mod2brr$residuals)
#Noraml p>=0,05

## Outliers nos resíduos:
summary(rstandard(mod2brr))


## Independência dos resíduos (Durbin-Watson):
durbinWatsonTest(mod2brr)


## Homocedasticidade (Breusch-Pagan):
bptest(mod2brr)

# Passo 4: Análise do modelo
summary(mod2brr)
summary(mod2br)
summary(mod2b)


## Obtenção dos coeficientes padronizados
lm.beta(mod2brr)
lm.beta(mod2br)
lm.beta(mod2b)


## Obtenção do IC 95% para os coeficientes
confint(mod2brr)
confint(mod2br)
confint(mod2b)


# Comparação de modelos

## AIC e BIC - Comparação entre quaisquer modelos
AIC(mod2brr,mod2br, mod2b)
BIC(mod2brr,mod2br, mod2b)


## Para comparação entre modelos aninhados

anova(mod2brr,mod2br, mod2b)


modfacebook <- lm(`Faturamento Total` ~Alcance + Impressoes + Frequencia   + Cliques +CTR +CPM +CPC +Resultados  +CustoResult   +Custo , datafacebook)

pacman::p_load(MASS)


mod.inicial <-  lm(`Faturamento Total` ~Alcance + Impressoes + Frequencia   + Cliques +CTR +CPM +CPC +Resultados  +CustoResult   +Custo , datafacebook)

mod.simples <- lm(`Faturamento Total` ~ 1, data = datafacebook)

stepAIC(mod.inicial, scope = list(upper = mod.inicial,
                                  lower = mod.simples), direction = "backward")


# Material consultado: https://rpubs.com/bensonsyd/385183
