# Passo 1: Carregar os pacotes que serão usados

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

## Construção do modelo:
mod <- lm(`Faturamento Total` ~ Impressoes  + Cliques +CTR +CPM +CPC +Conversões +TaxaConv +TaxaConv +CustoConv +Custo , datagoogle)

## Análise gráfica:
par(mfrow=c(2,2))

plot(mod)

par(mfrow=c(1,1))

## Normalidade dos resíduos:
shapiro.test(mod$residuals)
#Noraml p>=0,05

## Outliers nos resíduos:
summary(rstandard(mod))


## Independência dos resíduos (Durbin-Watson):
durbinWatsonTest(mod)


## Homocedasticidade (Breusch-Pagan):
bptest(mod)


## Ausência de Multicolinearidade

pairs.panels(datagoogle)
### Multicolinearidade: r > 0.9 (ou 0.8)

vif(mod)
### Multicolinearidade: VIF > 10

###### Criação de um segundo modelo
mod2 <- lm(`Faturamento Total` ~ Impressoes  + Cliques +CTR +CPM +Conversões +TaxaConv +TaxaConv +CustoConv +Custo , datagoogle)

## Análise gráfica:
par(mfrow=c(2,2))

plot(mod2)

par(mfrow=c(1,1))

## Normalidade dos resíduos:
shapiro.test(mod2$residuals)
#Noraml p>=0,05

## Outliers nos resíduos:
summary(rstandard(mod2))


## Independência dos resíduos (Durbin-Watson):
durbinWatsonTest(mod2)


## Homocedasticidade (Breusch-Pagan):
bptest(mod2)


## Ausência de Multicolinearidade

pairs.panels(datagoogle)
### Multicolinearidade: r > 0.9 (ou 0.8)

vif(mod2)
### Multicolinearidade: VIF > 10



# Passo 4: Análise do modelo
summary(mod)
summary(mod2)


## Obtenção dos coeficientes padronizados
lm.beta(mod)
lm.beta(mod2)


## Obtenção do IC 95% para os coeficientes
confint(mod)
confint(mod2)


# Comparação de modelos

## AIC e BIC - Comparação entre quaisquer modelos
AIC(mod, mod2)
BIC(mod, mod2)

help(lm)
## Para comparação entre modelos aninhados

anova(mod, mod2)
