# Passo 1: Carregar os pacotes que ser�o usados

if(!require(pacman)) install.packages("pacman")
library(pacman)

pacman::p_load(dplyr, car, rstatix, lmtest, ggpubr,
               QuantPsyc, psych, scatterplot3d)
library(readr)
datagoogle <- read_csv("TCCR/datagoogle.csv", 
                       col_types = cols(Dia = col_date(format = "%Y-%m-%d"), 
                                        Impressoes = col_integer()))
View(datagoogle)

str(datagoogle)

## Constru��o do modelo:
mod <- lm(`Faturamento Total` ~ Impressoes  + Cliques +CTR +CPM +CPC +Convers�es +TaxaConv +TaxaConv +CustoConv +Custo , datagoogle)

## An�lise gr�fica:
par(mfrow=c(2,2))

plot(mod)

par(mfrow=c(1,1))

## Normalidade dos res�duos:
shapiro.test(mod$residuals)
#Noraml p>=0,05

## Outliers nos res�duos:
summary(rstandard(mod))


## Independ�ncia dos res�duos (Durbin-Watson):
durbinWatsonTest(mod)


## Homocedasticidade (Breusch-Pagan):
bptest(mod)


## Aus�ncia de Multicolinearidade

pairs.panels(datagoogle)
### Multicolinearidade: r > 0.9 (ou 0.8)

vif(mod)
### Multicolinearidade: VIF > 10

###### Cria��o de um segundo modelo
mod2 <- lm(`Faturamento Total` ~ Impressoes  + Cliques +CTR +CPM +Convers�es +TaxaConv +TaxaConv +CustoConv +Custo , datagoogle)

## An�lise gr�fica:
par(mfrow=c(2,2))

plot(mod2)

par(mfrow=c(1,1))

## Normalidade dos res�duos:
shapiro.test(mod2$residuals)
#Noraml p>=0,05

## Outliers nos res�duos:
summary(rstandard(mod2))


## Independ�ncia dos res�duos (Durbin-Watson):
durbinWatsonTest(mod2)


## Homocedasticidade (Breusch-Pagan):
bptest(mod2)


## Aus�ncia de Multicolinearidade

pairs.panels(datagoogle)
### Multicolinearidade: r > 0.9 (ou 0.8)

vif(mod2)
### Multicolinearidade: VIF > 10



# Passo 4: An�lise do modelo
summary(mod)
summary(mod2)


## Obten��o dos coeficientes padronizados
lm.beta(mod)
lm.beta(mod2)


## Obten��o do IC 95% para os coeficientes
confint(mod)
confint(mod2)


# Compara��o de modelos

## AIC e BIC - Compara��o entre quaisquer modelos
AIC(mod, mod2)
BIC(mod, mod2)

help(lm)
## Para compara��o entre modelos aninhados

anova(mod, mod2)
