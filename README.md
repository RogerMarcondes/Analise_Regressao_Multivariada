<div align="center">    
 
## Análise Estatística em Marketing Digital
#### Trabalho de conclusão de curso apresentado como parte dos requisitos do para a obtenção do título de Bacharel em Estatística da Universidade de São Paulo - USP.


</div>

<!-- TODO: Add video -->

### Domínio de aplicação


 <div text-align="justify" align="justify">    
Em campanhias de markting digital estamos interesados em realizar conversões atráves de divulgação de conteúdo na mídias sociais, entenda-se como conversão influenciar um determinado público alvo em realização uma ação, como comprar produtos, contratar serviços, criar vinculo fidelidade, ou seja, qualquer ação que o cliente bunisses necessite. O uso das ferramentas de divulgação em mídias sociais está atrelado a métricas de divulgação (por exemplo, alcance, cliques, retenção, interações com o material divulgado) ao processo de conversão, também conhecido como "Fúnil de conversão" recebendo este nome devido ao formato da densidade do público envolvido em cada etapa ( camada do fúnil ) do processo. Em cada camada do fúnil temos o uso de combinações de métricas configuraveis nas plataformas de campanhia como metas para determinado material de divulgação, sendo que o valor investido em cada meta é estimado pela plataforma, mas pode ou não alcançar a meta determinado, resulmidamente, é analisado a performance de determinada métrica verificando o resultado alcançado com o estimado e conforme avaliado a divulgação é descontinuada, modificada, ou substituida. 

  Portanto, o estudo realizado neste documento contempla a análise de impacto das mídias para o faturamento total, e visto o projeto e seleção de modelo de regressão viável realizar predições a cerca do faturamento pelas mídias e suas métricas.
</div>


### Conteúdo da base de dados
 <div text-align="justify" align="justify">    
Os dados utilizados para este trabalho, descrevem as métricas de divulgação do conteúdo associado ao faturamento obtido com as conversões, e cada mídia (google, facebook, instagram e tiktok) possuem sua plataforma, logo cada qual com suas métricas e investimento correspondente. 
Os dados retratam um cliente real da agência de marketing digital Raccoon, logo todas as referências ao cliente como título de campanhia seram omitidos presenvando a unicidade das tuplas nas tabelas obtidas, com exceção a substituição da identidade do cliente os demais pré-processamentos e tratamento do banco de dados - como formatação, tratamento de valores Nan, tuplas duplicas -  seram matidas no tópico correspondente. 


</div>

### Resultado
 <div text-align="justify" align="justify">    
Com as análises foi possível verificar como as ações de marketing influênciava a receita das marcas, possibilitando elaborar uma curva de tendência, que convergil com a realidade, além de verificar as principais métricas de influência.


  &nbsp;
<div align="center" >   
 
![image](https://github.com/RogerMarcondes/Analise_Regressao_Multivariada/blob/4ec3a69ff13f38a368ce4a286a9f17277f195427/AnaliseExploratoriaRegressaoMultiplaPython/trend.png)

</div>


Como resumido no material: [`Apresentação.pdf`](./Apresentação.pdf)

</div>

<!-- TODO: Add video -->

## Conteúdo do projeto

 - [`Apresentação.pdf`](./Apresentação.pdf) - Apresentação completa, com todas as informações:
    - Motivação do problema
    - Métodos de coleta e limpeza dos dados
    - Análise exploratória e estudo de correlação de variáveis
    - Desenvolvimento e execução dos modelos
    - Avaliação de resultados. 
 - [`AnaliseExploratoriaR\`](./AnaliseExploratariaR/) - Repositório do projeto baseado em R para análise exploratória e experimentação dos modelos de regressão 
 - [`AnaliseExploratoriaRegressaoMultiplaPython\`](./AnaliseExploratoriaRegressaoMultiplaPython/) - Repositório do projeto baseado em Python para análise exploratória, limpeza de dados, kfolds dos modelos de regressão, com aplicação dos métodos de avaliação de modelo VIF 


### Como Executar

#### Dependências
 -  R>=3.5
 -  JupiterNotebook>=6.0.0
