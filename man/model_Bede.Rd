% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_Bede.R
\name{model_Bede}
\alias{model_Bede}
\title{Model Function}
\usage{
model_Bede(Input_df, Response, Var1, Var2, RandomVar1, Metric, Mixed, Family)
}
\arguments{
\item{Input_df}{a dataframe in tidy format.}

\item{Response}{column from Input_df that includes the response variable}

\item{Var1}{column from Input_df that includes a fixed effect.}

\item{Var2}{column from Input_df that includes a fixed effect.}

\item{RandomVar1}{column from Input_df that includes a random effect. (must be a factor)}

\item{Metric}{column from Input_df that specifies each response variable metric.}

\item{Mixed}{logical. if TRUE RandomVar1 is required to carry out glmm. if FALSE RandomVar1 not needed and glm carried out.}

\item{Family}{column from Input_df that specifies the family/distribution to used for each metric. options: "gaussian", "poisson", "gamma" or "beta"}
}
\description{
This Function applies a glm/glmm models applying model selection using AICc to input into plot_model_Bede()
It can handle beta, gamma and poisson models with ease, gaussian is currently in development
}
\examples{

df1<-data.frame(Response=rnorm(3000, mean=10, sd=2),
                Var1=rep(c("A","B","C"),1000),
                Var2=c(rep("X",1000),rep("Y",1000),rep("Z",1000)),
                RandomVar1=rep(c("ID_1","ID_2","ID_3","ID_4"),750),
                Metric=rep("Water_Temp",3000),
                Family=rep("gaussian",3000))

df2<-data.frame(Response=rbeta(3000,0.5,1),
                Var1=rep(c("A","B","C"),1000),
                Var2=c(rep("X",1000),rep("Y",1000),rep("Z",1000)),
                RandomVar1=rep(c("ID_1","ID_2","ID_3","ID_4"),750),
                Metric=rep("Infection_Prop",3000),
                Family=rep("beta",3000))

df3<-data.frame(Response=rgamma(3000, 30),
                Var1=rep(c("A","B","C"),1000),
                Var2=c(rep("X",1000),rep("Y",1000),rep("Z",1000)),
                RandomVar1=rep(c("ID_1","ID_2","ID_3","ID_4"),750),
                Metric=rep("Tree_Height",3000),
                Family=rep("gamma",3000))

Input_df<-rbind(df1,df2,df3) \%>\% dplyr::mutate(Var1=as.factor(Var1),Var2=as.factor(Var2),RandomVar1=as.factor(RandomVar1))

Modelled<-model_Bede(Input_df=Input_df,Response="Response",
                     Var1="Var1",Var2="Var2",RandomVar1="RandomVar1",
                     Metric="Metric",Mixed=TRUE,Family="Family")
}
\keyword{Model}
