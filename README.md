# Credibility Theory  
[toc]
# Credibility Theory  {#main}


$
\DeclareMathOperator*{\E}{\mathbb{E}}
\DeclareMathOperator*{\V}{\mathbb{Var}}
$

[*Credibility Theory and Generalized Linear Models*, Nelder and Verral](https://www.casact.org/library/astin/vol27no1/71.pdf)

- Risk parameter is Random Variable
- Best linear approximation to Bayesian estimate
- For exponential family of distributions, the credibility formula is exact
- Exponential families: basis of Generalized Linear Models

### [*Evolutionary Credibility Theory: A Generalized Linear Mixed Modeling Approach*, Tze Leung Lai & Kevin Haoyu Sun](https://www.soa.org/Library/Journals/NAAJ/2012/june/naaj-2012-vol16-no2-lai.aspx)

##Credibility Problem
The credibility problem is the following. You observed loss data $\{Y_{ij}\}$, for individuals $i\in\{1,2,\dots,n\}$ and time periods $j\in\{1,2,\dots,m\}$.

We look at the average loss for the i-th risk
$$
\bar Y_i =\frac{1}{m}\sum_{j=1}^m Y_{ij}.
$$

So each risk/individual has his own experience with his own historical mean $\bar Y_i$. If the difference in the individual historical means are very different, it might indicate that the portfolio is not homogeneous and some experience rating needs to be applied to better allocate premium through the population of risk.

### Model Assumptions.

 1.	 $\forall i,\exists \Theta_i$ and the elemets of the set $\{\Theta_i| i \in {1,2, \ldots,n}\}$ are i.i.d.
 1.	The vectors $\{(Y_{i1},Y_{i2},\ldots,Y_{im})| 1\le i\le n\}$ are i.i.d.	
 2.	For fixed $i$, given $\Theta_i$, the random variables $Y_{i1},Y_{i2},\ldots,Y_{im}$ are conditionally i.i.d. 

Assumption 1 means that there is a unobservable random variable $\Theta$ that is randomly distributed among the population of potential insured risk and choosing a risk, i.e. insuring a customer, is essentially an i.i.d. draw of a realization $\Theta_i$ of $\Theta$. So even though that "risk level random variable" is and remains impossible to identify precisely, it exists and each individual represents a realization of a level of risk.

Assumption 3 says that, for a given individual, the loss variables are independent and identically distributed.

### Notation

The **conditional expected mean:**  $m(\theta) = \E[Y_{ij}|\Theta_i=\theta]$

The **overall mean:** $\mu = \E[m(\Theta_i)]$

The **conditional variance:**  $s^2(\theta)= Var[Y_{ij}|\Theta_i=\theta]$

 $\bar Y_i$ is an estimator for $m(\Theta_i)$ but it ignores the variability given $\Theta_i$.
We would prefer an estimate that takes into account all the experience.

The credibility premium will be a premium of the form:
$$
P=a_{i0}+ a_{i10}Y_{i1}+a_{i2}Y_{i2}+\cdots +a_{im}Y_{im}
$$
i.e a linear combination of the observed


##Buhlmann Model
Let 
$$\sigma^2=\E[s^2(\Theta_i)]$$ 
and let 
$$v^2=Var[m(\Theta_i)]$$.

Note that $\sigma^2$ is not the variance of $Y_{ij}$, it is only a component of it.
In fact,
$$Var[Y_{ij}]=\sigma^2+v^2$$


The Buhlmann credibility premium is 
$$
P_B(i) = z \cdot \bar Y_i + (1-z) \cdot \mu
$$
where $z$ is the credibility factor assigned to the experience observed, $\bar X$ is the empirical mean and $\mu$ is the model mean.


The credibility factor $z$ is of the form 
$$
z = \frac{n}{n+k}
$$
where $n$ is a measure of exposure size and 
$$
k = 
\frac{\E[Var[X|\Theta]]}{Var[\E[X|\Theta]]}.
$$

The numerator, $\E[Var[X|\Theta]]$ is called the **Expected Value of the Process Variance**.

The denominator $Var[\E[X|\Theta]]$ is called the **Variance of the Hypothetical Means**.

Note that the credibility factor $z$ is often rewritten from $\frac{n}{n+k}$ to $\frac{1}{1+k/n}$.


### Estimators
So we need to estimate $\mu$, $\sigma^2$ and $v^2$.

The natural eztimator of $\mu$ is
$$
\hat\mu=\frac{1}{n\cdot m}\sum_{i=1}^n\sum_{j=1}^m Y_{ij}=\frac{1}{n}\sum_{i=1}^n\bar Y_i
$$

For the estimation of $s^2(\Theta_i)$, we use the unbiased estimator
$$
\frac{1}{m-1}\sum_{j=1}^m(Y_{ij}-\bar Y_i)^2
$$
so that
$$
\hat\sigma^2=\frac{1}{n\cdot(m-1)}\sum_{i=1}^n\sum_{j=1}^m(Y_{ij}-\bar Y_i)^2
$$

Note that $\bar Y_i$ is an unbiased estimator of $m(\Theta_i)$, therefore a natural estimate of $v^2$ could be
$$
\frac{1}{n-1}\sum_{i=1}^n(\bar Y_i - \hat\mu).
$$
However, this estimator turns out to be biased.
$$
\hat v^2=\frac{1}{n-1}\sum_{i=1}^n(\bar Y_i - \hat\mu)-\frac{1}{m}\hat\sigma^2
$$

## The Buhlmann Straub model
As in the Buhlmann credibility problem, we observe loss data $\{Y_{ij}\}$, for individuals $i\in\{1,2,\dots,n\}$ and time periods $j\in\{1,2,\dots,m\}$ but we also observe $\{W_{ij}\}$, exposure weights for each risk and time period.

We look at the average loss for the i-th risk
$$
\bar Y_i =\frac{1}{m}\sum_{j=1}^m Y_{ij}.
$$


For each risk $i$, there exists a parameter $\Theta_i$. The parameters $\Theta_1, \Theta_i$$\Theta_2, \ldots, \Theta_n$ are assumed i.i.d.	The vectors $\{(Y_{i1},Y_{i2},\ldots,Y_{im}),\Theta_i| 1\le i\le n\}$ are independent.	For fixed $i$, given $\Theta_i$, the random variables $Y_{i1},Y_{i2},\ldots,Y_{im}$ are conditionally i.i.d. 

We also assume that there are functions $m(\theta)$ and $s^2(\theta)$ such that
$$
	\E[Y_{ij}|\Theta_i=\theta]=W_{ij}\cdot m(\theta)
$$
and
$$
	Var[Y_{ij}|\Theta_i=\theta]=W_{ij}\cdot s^2(\theta).
$$

Just like in the Buhlmann model, we let 
$$\mu=\E[m(\Theta_i)],$$
$$\sigma^2=\E[s^2(\Theta_i)],$$
and
$$v^2=Var[m(\Theta_i)].$$

Denote the risk volume of the i-th risk over all m years by 
$$
W_{i\cdot}=\sum_{j=1}^m W_{ij}
$$
and the risk volume over all years and all insureds by
$$
W_{\cdot\cdot}=\sum_{j=1}^m W_{i\cdot}.
$$

### Calculations
First, we normalize the losses as $X_{ij}=Y_{ij}/W_{ij}$, i.e. we compute the loss ratios. With this notation, we directly obtain that
$$\E[X_{ij}|\Theta_i]=m(\Theta_i),$$
and
$$Var[X_{ij}|\Theta_i]=\frac{m(\Theta_i)}{W_{ij}}.$$

Let $X_i$ define the weighted mean of the annual losses of the i-th risk:
$$X_i=\frac{1}{W_{i\cdot}}\sum_{j=1}^mW_{ij}\cdot X_{ij}$$,
then the credibility premium is
$$
P_{BS}(\Theta_i)=z_i\cdot\bar X_i+(1-z_i)\cdot\mu
$$
where the credibility factor 
$$
z_i =\frac{W_{i\cdot}}{W_{i\cdot}+\frac{\sigma^2}{v^2}} = \frac{1}{1+\frac{\sigma^2}{W_{i\cdot}v^2}}
$$

### Estimators

1. $\mu:$
 $$\hat\mu=\frac{1}{W_{\cdot\cdot}}\sum_{i=1}^n\sum_{j=1}^mW_{ij}X_{ij}=\frac{1}{W_{\cdot\cdot}}\sum_{i=1}^nW_{i\cdot }\bar X_{i}.$$
 
1. $\sigma^2:$
$$\hat\sigma^2=\frac{1}{n(m-1)}\sum_{i=1}^n\sum_{j=1}^mW_{ij}(X_{ij}-\bar X_i)^2.$$
 
1. $v^2:$	 Let $$ W^* = \frac{1}{nm-1}
									   \sum_{i=1}^n
									   W_{i\cdot}\left(1-\frac{W_{i\cdot}}{W_{\cdot\cdot}}\right).
									   $$
									   Then $$v^2 = \frac{1}{W^*}
									   \left[ 
											   \left(
													   \frac{1}{n\cdot m -1}
													   \sum_{i=1}^n
													   \sum_{j=1}^m
													   W_{ij}(X_{ij}-\hat\mu)^2
											  \right)
											  - \hat\sigma^2
									   \right]
									   $$
### Effect of Missing Data 
Let $m_i$ the number of years with $W_{ij}\neq 0$, and also let $X_{ij}=0$ whenever $W_{ij} = 0$. With these rules, $\hat\mu$ is still unbiased.

Considering the effect on $\hat\sigma^2$ now, we can see that 
$$
	\E\left[ 
		\sum_{j=1}^m
		W_{ij}
		(X_{ij}-\bar X_i)^2
	\right]
		=
		(m_i -1)\sigma^2
$$
so the estimator of $\sigma^2$ must be changed to 
$$
	\hat\sigma^2 =
							\frac{1}{n}(m-1)
							\sum_{i=1}^n
							\frac{1}{m_i-1}
							\sum_{j=1}^m
							W_{ij} 
							(X_{ij}-\bar X_i)^2.
$$

Let's now look at the estimator of $v$. We have
$$
	\E
	\left[
			\sum_{i=1}^n
			\sum_{j=1}^m
			W_{ij}
			(X_{ij} - \hat\mu)^2
	\right]
   =
   (m_\cdot - 1)
   \cdot
   \sigma^2
   +
   \left(
		   W_{\cdot\cdot}
		   -
		   \sum_{i=1}^n
		   \frac{W_{i\cdot}}{W_{\cdot\cdot}}
   \right)
   \cdot
   v^2
$$
where, of course, 
$$
	m_\cdot 
	= 
	\sum_{i=1}^n
   m_{i}.
$$
Therefore, one has to change 
$$
	W^* = \frac{1}{m_\cdot-1}
				\sum_{i=1}^n
				 W_{i\cdot}
				 \left(
						 1-\frac{W_{i\cdot}}{W_{\cdot\cdot}}
				 \right).
$$
and 
$$
	v^2 = 
			\frac{1}{W^*}
		    \left[ 
			    \left(
						\frac{1}{m_\cdot -1}
						\sum_{i=1}^n
						\sum_{j=1}^m
						W_{ij}(X_{ij}-\hat\mu)^2
				 \right)
				 - \hat\sigma^2
			\right]
$$

## Hierarchical Model
Consider an insurance portfolio where contracts are classified into cohorts.
In our terminology, this is a two-level hierarchical classification structure. The
observations are claim amounts $S_{ijt}$, where index $i = 1, 2, \ldots , I$ identifies the cohort, index $ j = 1, 2, \ldots , J_i$ identifies the contract within the cohort and index $t = 1, 2, \ldots , n_{ij}$ identifies the period (usually a year). 

To each data point corresponds a weight — or volume – $w_{ijt}$. Then, the best linear prediction for the next period outcome of a contract based on ratios $X_{ijt} = S_{ijt}/w_{ijt} $ is
$$
	\hat\pi_{ij}
	= 
	z_{ij} \cdot X_{ijw} 
	+ 
	 (1 - z_{ij})
	 \cdot
	 \hat\pi_i
$$

$$
\hat\pi_i = z_i\cdot X_{izw} + (1 -z_i)\cdot m
$$
with the credibility factors
$$
	z_{ij} =
				\frac{w_{ij\Sigma}}{w_{ijk\Sigma} + s^2/a}
$$
sdfgfd
$$
 w_{ij\Sigma} = \sum_{t=1}^{n_{ij}}
							w_{ijt}
$$			
sdfsdf
$$
	z_i = \frac{z_{i\Sigma}}{z_{i\Sigma} + a/b}
$$
and
$$							
	z_{i\Sigma} =\sum_{j=1}^{J_i}
z_{ij}
$$
and the weighted averages
$$
X_{ijw} =
				\sum_{t=1}^{n_{ij}}
				\frac{w_{ijt}}{w_{ij\Sigma}}X_{ijt}
$$
and
$$
X_{izw}  =	
				\sum_{j=1}^{J_i}
				\frac{z_{ij}}{z_{i\Sigma}}
				X_{ijw}
$$
The estimator of s2 is
$$
	\hat s^2 =
					\frac{1}{\sum_{i=1}^I\sum_{j=1}^{J_i}(n_{ij}-1)}
					\sum_{i=1}^I\sum_{j=1}^{J_i}\sum_{t=1}^{n_{ij}}
					w_{ijt}
					\cdot
					(X_{ijt}-X_{ijw})^2					
$$

The three types of estimators for parameters $a$ and $b$ are the following.
First, let
$$
		A_i = \sum_{j=1}^{J_i}
		w_{ij\Sigma}
		(X_{ijw}- X_{iww})^2
		-
		(J_i -1)\cdot s^2
$$
where
$$
	 c_i = w_{i\Sigma\Sigma} 
			 - 
			  \sum_{j=1}^{J_i}
			  \frac{w_{ij\Sigma}}{	w_{i\Sigma\Sigma}}
$$

Also
$$
		B = \sum_{i=1}^{I}
		z_{i\Sigma}
		(X_{izw}- X_{zzw})^2
		-
		(I -1)\cdot a
$$
and
$$
	 d = z_{\Sigma\Sigma} 
			 - 
			  \sum_{i=1}^{I}
			  \frac{z_{i\Sigma}^2}{z_{\Sigma\Sigma}}
$$
with
$$
	 \bar X_{zzw} = 
							  \sum_{i=1}^{I}
							  \frac{z_{i\Sigma}}{z_{\Sigma\Sigma}}
			                 X_{izw}				  
$$

(Hence, $\E[A_i] = c_ia$ and $\E[B] = db$.) Then, the Bühlmann–Gisler estimators
are
$$
	\hat a = \frac{1}{I}
				 \sum_{i=1}^I
		\max\left(
						\frac{A_i}{c_i}, 0
		\right)	 
$$
and 
$$
	\hat b = 
		\max\left(
						\frac{B}{d}, 0
		\right)	 
$$

the Ohlsson estimators are
$$
	\hat a' = \frac{\sum_{i=1}^I A_i}{\sum_{i=1}^I c_i}
$$
and 
$$
	\hat b' = \frac{B}{d}
$$

and the iterative (pseudo-)estimators are
$$
	\tilde a = \frac{1}{
						\sum_{i=1}^I
						(J_i -1)
					}
					\sum_{i=1}^I
					\sum_{j=1}^{J_i}
					 z_{ij}
					(X_{ijw} - X_{izw})^2
$$
and 
$$
	\tilde b = \frac{1}{I -1}
					\sum_{i=1}^I
					z_{i}
					(X_{izw} - X_{zzw})^2
$$
where
$$
	X_{zzw} = \sum_{i=1}^I
		            \frac{z_i}{z_\Sigma}	
				    X_{izw}          
$$
Note the difference between the two weighted averages (3) and (10). See Belhadj
et al. (2009) for further discussion on this topic.
Finally, the estimator of the collective mean m is mˆ = Xzzw.
The credibility modeling function cm assumes that data is available in the
format most practical applications would use, namely a rectangular array (matrix
or data frame) with entity observations in the rows and with one or more
classification index columns (numeric or character). One will recognize the
output format of simul and its summary methods.
Then, function cm works much the same as lm. It takes in argument: a
formula of the form ˜ terms describing the hierarchical interactions in a data
set; the data set containing the variables referenced in the formula; the names
of the columns where the ratios and the weights are to be found in the data
set. The latter should contain at least two nodes in each level and more than
one period of experience for at least one entity. Missing values are represented
by NAs. There can be entities with no experience (complete lines of NAs).

In order to give an easily reproducible example, we group states 1 and 3 of
the Hachemeister data set into one cohort and states 2, 4 and 5 into another.
This shows that data does not have to be sorted by level. The fitted model
using the iterative estimators is:
```
> X <- cbind(cohort = c(1, 2, 1, 2, 2), hachemeister)
> fit <- cm(~cohort + cohort:state, data = X, ratios = ratio.1:ratio.12,
+ weights = weight.1:weight.12, method = "iterative")
> fit
Call:
cm(formula = ~cohort + cohort:state, data = X, ratios = ratio.1:ratio.12,
weights = weight.1:weight.12, method = "iterative")
Structure Parameters Estimators
Collective premium: 1746
Between cohort variance: 88981
Within cohort/Between state variance: 10952
Within state variance: 139120026
```
The function returns a fitted model object of class "cm" containing the
estimators of the structure parameters. To compute the credibility premiums,
one calls a method of predict for this class:
```
> predict(fit)
$cohort
[1] 1949 1543
$state
[1] 2048 1524 1875 1497 1585
```
One can also obtain a nicely formatted view of the most important results
with a call to summary:
```
> summary(fit)
Call:
cm(formula = ~cohort + cohort:state, data = X, ratios = ratio.1:ratio.12,
weights = weight.1:weight.12, method = "iterative")
Structure Parameters Estimators
Collective premium: 1746
Between cohort variance: 88981
Within cohort/Between state variance: 10952
Within state variance: 139120026
Detailed premiums
Level: cohort
cohort Indiv. mean Weight Cred. factor Cred. premium
1 1967 1.407 0.9196 1949
5
2 1528 1.596 0.9284 1543
Level: state
cohort state Indiv. mean Weight Cred. factor Cred. premium
1 1 2061 100155 0.8874 2048
2 2 1511 19895 0.6103 1524
1 3 1806 13735 0.5195 1875
2 4 1353 4152 0.2463 1497
2 5 1600 36110 0.7398 1585
```
The methods of predict and summary can both report for a subset of the
levels by means of an argument levels. For example:
```
> summary(fit, levels = "cohort")
Call:
cm(formula = ~cohort + cohort:state, data = X, ratios = ratio.1:ratio.12,
weights = weight.1:weight.12, method = "iterative")
Structure Parameters Estimators
Collective premium: 1746
Between cohort variance: 88981
Within cohort variance: 10952
Detailed premiums
Level: cohort
cohort Indiv. mean Weight Cred. factor Cred. premium
1 1967 1.407 0.9196 1949
2 1528 1.596 0.9284 1543
> predict(fit, levels = "cohort")
$cohort
[1] 1949 1543
```
The results above differ from those of Goovaerts and Hoogstad (1987) for
the same example because the formulas for the credibility premiums are different.

##Buhlmann Straub call
$\E_{x\in A}$ and $\displaystyle \E_{x\in A}$
vs
$$\E_{x\in A}$$

$
\DeclareMathOperator*{\Var}{\mathrm{Var}}
$
$\Var_{x\in A}$ and $\displaystyle \Var_{x\in A}$
vs
$$\Var_{x\in A}$$

$
\DeclareMathOperator*{\Cov}{\mathrm{Cov}}
$
$\Cov_{x\in A}$ and $\displaystyle \Cov_{x\in A}$
vs
$$\Cov_{x\in A}$$


```
cm(~state, hachemeister, ratios = ratio.1:ratio.12)
```
Include Images
![enter image description here](https://drive.google.com/uc?export=download&id=0B4foEG5BEjCqeE1WUVczSElJRXM)

##Gisler's Book Hierarchical Implementation

| Level | Interpretations       | Variables         | Indices  | Set of  Indices  |
|:-:       | ---	                        | :--:	                 |:-:	        | :-:                      |
|    4    |  Line of Business 	| $\mu_0$         |           	|   	                       |
|    3    |  Classes	                | $\Psi$ 	         |  g  	        |             G           |
|    2    |  Risk Groups     	    | $\Phi$            |  h  	        |   	          H           |
|    1    |  Individual Risks	    | $\Theta$        |  i 	        |              I            |
|    0    |  Data	                    | $\mathbf{D}$ |  ij	        |                           |

###Some Notation:

$\Phi(\Psi_g) = $ set of $\Phi$'s that stem from $\Psi_g$
$\mathbf{D}(\Phi_h) = $ set of observations $X_{ij}$'s that stem from $\Phi_h$

###Assumptions

 - The random variables $\Psi_g\ \ (g= 1, 2, \ldots, |G|)$ are i.i.d. with density $r_3(\psi)$.
 - Given $\Psi_g$, the random variables $\phi_h\in \Phi(\Psi_g)$ are i.i.d. with the conditional density $r_2(\phi|\Psi_g)$.
 - Given $\Phi_h$, the random variables $\theta_i\in \theta(\Phi_h)$ are i.i.d. with the conditional density $r_1(\nu|\Phi_h)$.
 - Given $\theta_i$, the observations $X_{ij}\in \mathbf{D}(\theta_i)$ are conditionally independant with densities $r_0(x|\theta_i, w_{ij}),$ for which
 $$
 \E\left[X_{ij}| \Theta_i\right]= \mu(\Theta_i)
 $$
and
 $$
 \V \left[X_{ij}| \Theta_i\right]= \mu(\Theta_i) = \frac{\sigma^2(\Theta_i)}{Wij}
 $$
 where $w_{ij}$= known weights.

### More Notation
$$
\begin{align}
\mu_0 &= \E[X_{ij}]\\
\mu(\Psi_g) &= \E[X_{ij}|\Psi_g], &\text{where } X_{ij}\in\mathbf{D}(\Psi_g),\\
\mu(\Phi_h) &= \E[X_{ij}|\Phi_h], &\text{where } X_{ij}\in\mathbf{D}(\Phi_h),\\
\mu(\Theta_i) &= \E[X_{ij}|\Theta_i], &\text{where } X_{ij}\in\mathbf{D}(\Theta_i).\\
\end{align}
$$

### Structural Parameters
$$
\begin{align}
\mu_0 &= \E[X_{ij}]\\
\sigma^2 &= \E[\sigma^2(\Theta_i)] &\text{at level 0},\\
\tau_1^2 &= \E\left[\V \left[\mu(\Theta_i)|\Phi_h\right]\right] 
			= \E[\tau_1(\Phi_h)] &\text{at level 1},\\
\tau_2^2 &= \E\left[\V \left[\mu(\Phi_h)|\Psi_g\right]\right] 
			= \E[\tau_2(\Psi_g)] &\text{at level 2},\\
\tau_3^2 &= \V [\mu(\Psi_g)] &\text{at level 3}.
\end{align}
$$

### Credibility Premia
$$
\begin{align}
\widehat{\mu(\Theta_i)} &= 
											\alpha_i^{(1)}\cdot B_i^{(1)} 
											+ ( 1 - \alpha_i^{(1)})\cdot \mu(\Phi_h)\\
\widehat{\mu(\Phi_h)} &= 
											\alpha_h^{(2)}\cdot B_h^{(2)} 
											+ ( 1 - \alpha_h^{(2)})\cdot \mu(\Psi_g)\\
\widehat{\mu(\Psi_g)} &= 
											\alpha_g^{(3)}\cdot B_g^{(3)} 
											+ ( 1 - \alpha_g^{(3)})\cdot \mu_0
\end{align}
$$

### Best individually unbiased estimators

$$
\begin{align}
B_i^{(1)} &= 
				   \sum_{j\in J}
				   \frac{w_{ij}}{w_{i \bullet }}, &\text{ where } w_{i\bullet} \sum_{j\in J} w_{ij}
				  \\
\alpha_i^{(1)} 	&= 
							 \frac{w_{i \bullet }}{w_{i \bullet } +\frac{\sigma^2}{\tau_1^2}}
                            \\
B_h^{(2)} &= 
					 \sum_{i\in I_h}
				     \frac{\alpha_i^{(1)}}{w_h^{(2)}}B_i^{(1)}, 
			 	    &\text{ where } I_h=\{i:\Theta_ie\Theta(\Phi_h)\},\\
			 	    & & \text{and where } w_{h^(2)} \sum_{i\in I_h} \alpha_i^{(1)} 
				   \\
\alpha_h^{(2)} 	&= 
							 \frac{w_h^{(2)}}{w_h^{(2)} +\frac{\tau_1^2}{\tau_2^2}},
                            \\
B_g^{(3)} &= 
					 \sum_{h\in H_g}
				     \frac{\alpha_h^{(2)}}{w_g^{(3)}}B_h^{(2)}, 
			 	    &\text{ where } H_g=\{h:\Phi(h)\in \Phi(\Psi_g)),\\
			 	    & & \text{and where } w_{g^(3)} \sum_{h\in H_g} \alpha_h^{(2)} 
				   \\
\alpha_g^{(3)} 	&= 
							 \frac{w_g^{(3)}}{w_g^{(3)} +\frac{\tau_2^2}{\tau_3^2}},
                            \\
\widehat{\widehat{\mu_0}}   &= 
													\sum_{g\in G}
													\frac{\alpha_g^{(3)}}{w^{(4)}}
													B_g^{(3)}
												&\text{ where } w^{(4)} = \sum_{g\in G}\alpha_g^{(3)}.
\end{align}
$$
### Estimation of the Structural Parameters
For $\sigma^2$ and $\tau_1^2$, we can use the Buhlmann Straub estimators. For the higher levels, i.e. $\tau_2^2$ and $\tau_3^2$,  another approach is recommended.

Let's list the sets of nodes in the hierarchical tree:

$$\begin{align}
\mathbb{G}&:=\{g : \Psi_g\in \Psi(\mu_0)\}\\
\mathbb{H}&:=\bigcup_{ g\in \mathbb{G}}\mathbb{H}_g\\\
\mathbb{I}&:=\bigcup_{h\in \mathbb{H}} \mathbb{I}_h
\end{align}$$

Further, we denote the number of elements in a set with $|\cdot|$.

#### Examples

-	$|\mathbb{I}_h| =$ Number of nodes at the $\Theta$-level which stems from $\Theta_h$.
-	$||\mathbb{I}| =$ Total number of nodes at the $\Theta$-level.
-	$||\mathbb{G}| =$ Total number of nodes at level 3.

We denote the number of observations for the i-th risk by $n_i$.

### Estimation of $\sigma^2$
$$\begin{align}
S_i &:=
			\frac{1}{n_i -1}
			\sum_{j}w_{ij}(X_{ij}- B_i^{(1)})^2
\\
S &:=
			\sum_{i\in\mathbb{I}}
			\frac{n_i -1}{n_\bullet - |\mathbb{I}|}
			\cdot S_i
			&=
			\frac{1}{n_\bullet - |\mathbb{I}|}
			\sum_{j}w_{ij}(X_{ij}- B_i^{(1)})^2
\end{align}$$

We let $$\widehat{\sigma^2} = S.$$

### Estimation of $\tau_1^2$
Consider
$$
\begin{align}
\widehat{T_h^{(1)}} &= 
									c_h\cdot 
									\left\{ 
										\frac{|I_h|}{|I_h|-1}
										\cdot
										\sum_{i\in I_h}
										\frac{w_{i\bullet}}{z_h^{(1)}}
										\cdot
										\left(
												B_i^{(1)} -\overline{B}_h^{(1)}
										\right)^2
																				-\frac{|I_h|\cdot\widehat{\sigma^2}}{z_h^{(1)}}
									\right\}\\
									\\
									\text{where}\\
									\\
									z_h^{(1)}&=\sum_{i\in I_h}w_{i\bullet},\\
									\overline{B}_h^{(1)} &= \sum_{i\in I_h}\frac{w_{i\bullet}}{z_h^{(1)}}\cdot B_i^{(1)},\\
									c_h= 
											\frac{|I_h|-1}{|I_h|}
											\left\{
													\sum_{i\in I_h}\frac{w_{i\bullet}}{{z_h^{(1)}}}
													\left(
															1-\frac{w_{i\bullet}}{z_h^{(1)}}
													\right)
											\right\}^{-1}
	\end{align}
	$$
	So we choose 
	$$
	\widehat{\tau_1^2} = 
										\frac{1}{|H|}
										\sum_{h\in H}
										\max
										\{\widehat{T_h^{(1)}},0\}
	$$
	as estimator of $\widehat{\tau_1^2}$


### Estimation of $\tau_2^2$
We define
$$
\begin{align}
\widehat{T_g^{(2)}} &= 
									c_h\cdot 
									\left\{ 
										\frac{|H_g|}{|H_g|-1}
										\cdot
										\sum_{h\in H_g}
										\frac{w_{h}^{(2)}}{z_g^{(2)}}
										\cdot
										\left(
												B_h^{(2)} -\overline{B}_g^{(2)}
										\right)^2
										-\frac{|H_g|\cdot\widehat{\tau_1^2}}{z_g^{(2)}}
									\right\}\\
									\\
									\text{where}\\
									\\
									z_g^{(2)}&=\sum_{h\in H_g}w_h^2,\\
									\overline{B}_g^{(2)} &= \sum_{h\in H_g}
									\frac{w_h^2}{z_g^{(2)}}
									\cdot \overline B_h^{(2)},\\
									c_g= 
											\frac{|H_g|-1}{|H_g|}
											\left\{
													\sum_{h\in H_g}
													\frac{w_h^{2}}{{z_g^{(2)}}}
													\left(
															1-\frac{w_h^{2}}{z_g^{(2)}}
													\right)
											\right\}^{-1}.
	\end{align}
	$$
	So we choose 
	$$
	\widehat{\tau_2^2} = 
										\frac{1}{|G|}
										\sum_{g\in G}
										\max
										\{\widehat{T_g^{(2)}},0\}
	$$
	as estimator of $\tau_2^2$






### Estimation of $\tau_3^2$
Following the same scheme as the estimation of $\tau^2_2$, we define
$$
\begin{align}
\widehat{T^{(3)}} &= 
									c\cdot 
									\left\{ 
										\frac{|G|}{|G|-1}
										\cdot
										\sum_{g\in G}
										\frac{w_{g}^{(3)}}{z^{(3)}}
										\cdot
										\left(
												B_g^{(3)} -\overline{B}^{(3)}
										\right)^2
										-\frac{|G|\cdot\widehat{\tau_2^2}}{z^{(3)}}
									\right\}\\
									\\
									\text{where}\\
									\\
									z^{(3)}&=\sum_{g\in G}w_g^{(3)},\\
									\overline{B}^{(3)} &= 
																		\sum_{g\in G}
																		\frac{w_g^{(3)}}{z^{(3)}}
																		\cdot \overline B_g^{(3)},
																		\\
									c= 
											\frac{|G|-1}{|G|}
											\left\{
													\sum_{g\in G}
													\frac{w_g^{(3)}}{{z^{(3)}}}
													\left(
															1-\frac{w_g^{(3)}}{z^{(3)}}
													\right)
											\right\}^{-1}.
	\end{align}
	$$
	So we choose 
	$$
	\widehat{\tau_3^2} = 
										\max
										\{\widehat{T_g^{(3)}},0\}
	$$
	as estimator of $\tau_3^2$




#IRM Implementation

Using the *actuar* **R** package.

Create the *hachemeister* dataset:

```
library(actuar)
library(foreign)
vignette("credibility")
data.frame(hachemeister)

write.foreign(
              data.frame(hachemeister),                    
              "C:/Bits/cred/meister.txt", 
              "c:/Bits/cred/meister.sas", 
              package="SAS"
              )
# Write out the transpose dataset
write.foreign(
              data.frame(t(hachemeister)),                    
              "C:/Bits/cred/tmeister.txt", 
              "c:/Bits/cred/tmeister.sas", 
              package="SAS"
              )
```
## My Google Drive
https://drive.google.com/drive/folders/0B4foEG5BEjCqdk5oQTluV01pWnc

## Tip
Tip: You can open any markdown URL within StackEdit Viewer using viewer#!url=.

## Markdown Reference
[Quick Markdown Reference](http://genius.com/5050676)

##Password useage in Mercurial
http://www.swiftsoftwaregroup.com/how-to-configure-tortoisehg-to-remember-your-username-and-password/


From this question I learned this syntax:

https://stackedit.io/viewer#!url=http://path/to/markdown.md
However I did not find how to open a local file (which is possible with the "Import from disk" dialog).

Is is possible to open a local document with a similar syntax to:

https://stackedit.io/viewer#!url=file:///C:/test.md
stackedit
shareimprove this question
asked Jun 24 '15 at 12:37

Unfortunately, the app does not handle any (download) protocol but http and https.

If you just wanted to access them (not edit and save) you could run a simple static file server you could access them, just not save them. Likely useless, I know, but here for completeness.

Because the app is hosted in a browser, you wont have real access to your local File System (except through Dropbox/Google Docs, which use an API). You can see that the app also has a local version of an MD file included, but again, read only.

I am sure there will be someone who might host it in electron, which would give you complete File System access with a few minimal tweaks.

I for one would love to integrate this into an internal documentation server. Along with my thousand other projects I want to work on...

http://www.wildandscruffy.com/woodworking-projects/metal-lathe-project-plans

http://www.green-trust.org/junkyardprojects/FreeHomeWorkshopPlans.html

http://absolutelyfreeplans.com/metalworking/metalworking.htm





##Introduction
* From Nelder and Verral
    - Risk parameter is Random Variable
    - Best linear approximation to Bayesian estimate
    - For exponential family of distributions, the credibility formula is exact
    - Exponential families: basis of Generalized Linear Models

## Log of progress

### First, attaching the **actuar** package in **R**,
and create the *hachemeister* dataset as follows:

```
library(actuar)
library(foreign)
vignette("credibility")
data.frame(hachemeister)

write.foreign(
              data.frame(hachemeister),                    
              "C:/Bits/cred/meister.txt", 
              "c:/Bits/cred/meister.sas", 
              package="SAS"
              )
# Write out the transpose dataset
write.foreign(
              data.frame(t(hachemeister)),                    
              "C:/Bits/cred/tmeister.txt", 
              "c:/Bits/cred/tmeister.sas", 
              package="SAS"
              )
```

##The Buhlmann Straub call in R
```
cm(~state, hachemeister, ratios = ratio.1:ratio.12)
```
and the corresponding result
```
Call:
cm(formula = ~state, data = hachemeister, ratios = ratio.1:ratio.12)

Structure Parameters Estimators

  Collective premium: 1671.017 

  Between state variance: 72310.02
  Within state variance: 46040.47 
```

Surfacing the code outside the package so that it can be modified 
and debugged as we go.

```
source( file = "C:/Bits/cred/jrUtil.R")
source(file = "C:/Bits/cred/actuar/cm.R")
source(file = "C:/Bits/cred/actuar/bstraub.R")
DEBUG = T
cm(~state, hachemeister, ratios = ratio.1:ratio.12)
Call:
cm(formula = ~state, data = hachemeister, ratios = ratio.1:ratio.12)

Structure Parameters Estimators

  Collective premium: 1671.017 

  Between state variance: 72310.02
  Within state variance: 46040.47 
```

Good, the results are the same.


Now, on the way to a SAS version.




### Some references
[*Credibility Theory and Generalized Linear Models*, Nelder and Verral](https://www.casact.org/library/astin/vol27no1/71.pdf)
[*Evolutionary Credibility Theory: A Generalized Linear Mixed Modeling Approach*, Tze Leung Lai & Kevin Haoyu Sun](https://www.soa.org/Library/Journals/NAAJ/2012/june/naaj-2012-vol16-no2-lai.aspx)

