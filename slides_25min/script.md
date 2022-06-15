# The College Application Problem 
# 대학 입학 지원 최적화 문제

Max Kapur

## Introduction

Hello, my name is Max, from the Management Science/Optimization lab. Thank you so much for agreeing to participate on my thesis defense committee and for coming to my presentation today. Today, I will be speaking about our research into a combinatorial optimization problem that we call the college application problem.

안녕하세요. 경영과학/최적화 연구실의 맥스라고 합니다. 저의 졸업 논문 심사 위원에 참여해주고 오늘 발표를 들으러 오셔서 정말로 감사드립니다. 오늘 발표에서는, ‘대학 입학 지원 최적화 문제’라고 부르는 조합 최적화 문제에 대한 저희의 연구를 소개해 드리고자 하겠습니다.

To the best of our knowledge, we are the first to study this problem systematically. In a nutshell, this problem involves purchasing a portfolio of random variables having the maximal expected maximum value subject to a budget constraint. The word “maximum” appears there twice on purpose, which gives this problem a unique mathematical form. Today, we will explain this optimization problem and how it can be used to model the college application strategy. Then we will introduce our findings about this problem, including its theoretical properties and a variety of algorithms. Finally, we will report the results of a computational study examining the empirical performance of our algorithms.

저희가 알기로는 이 문제를 체계적으로 분석하는 것은 처음입니다. 문제를 한 문장으로 요약하자면, 예산 제약식 하에서, 여러 확률 변수를 구매하는 문제인데, 그것의 기대 최댓값을 최대화하는 문제입니다. ‘max’라는 말이 두번 나타나는데, 이것 때문에 문제의 수리 모형이 조금 독특해집니다. 오늘의 발표에서는, 이 최적화 문제의 수리 모형 그리고 이 모형을 어떻게 입학 지원 전략에 적용할 수 있는지 먼저 설명해드리겠습니다. 그다음에, 이 문제에 대한 이론적인 성질 그리고 해법 알고리즘을 탐구한 저희의 연구 결과를 정리하겠습니다. 마지막으로, 저희 해법의 실제적 성능을 살펴본 계산 실험 결과를 공유해드리겠습니다.

The college application problem spans several methodological universes. First, it’s a kind of asset allocation problem, in the sense that you are buying products based on uncertain information about their utility, and have to manage the attendant risk/reward tradeoff. Second, this problem generalizes the knapsack problem, meaning that is is NP-complete, and if we want an efficient solution, we have to settle for approximation methods based on combinatorial techniques. Finally, we note that the objective function is submodular. However, our results suggest that college application is a relatively easy instance of submodular maximization.

대학 입학 지원 최적화 문제는 다양한 방법론에 걸쳐 있는데요. 먼저, 불확실한 정보를 가지고 상품을 구매하는 문제이므로, 일종의 포트폴리오 배분 문제로 생각할 수 있습니다. 이때 위험과 보상의 균형을 맞추는 것이 중요한 요소입니다. 그다음은, 이 문제는 배낭 문제의 일반적인 케이스이므로 NP-complete합니다. 효율적인 해법이 필요하면, 조합 최적화 기법을 이용한 근사 해법을 사용할 수밖에 없다고 의미합니다. 마지막, 대학 지원 문제의 목적함수는 submodular 집합 함수입니다. 그렇지만, 저희 연구 결과에 따르면, submodular 최대화 문제의 클래스 안에서 대학 지원 문제가 비교적 쉬운 인스턴스임을 확인할 수 있습니다.

## Model
Let’s talk about our model.

먼저 모형을 설명해드리도록 하겠습니다.

In our model, we restrict our attention to a single student’s decisionmaking in a college market having $m$ schools. For each school, we know the student’s probability of admission $f_j$. For our purposes, $f_j$ is an exogeneous variable, but in an operational context, this probability is something you can estimate from students’ academic records, test scores, and demographic information using logistic regression. Bear in mind that $f_j$ is not school $j$’s acceptance rate: it is the admissions probability specifically for this student. And we call the associated Bernoulli variable $Z_j$, which equals one if the student is admitted, and zero if not, to the school in question. We assume these are statistically independent. Now the student’s principle decision is where to apply. We use $\mathcal{X}$ to denote the set of schools that the student applies to, which we can call her application portfolio. The application portfolio is constrained by various costs associated with college application. We consider a single knapsack constraint, where $g_j$ is the cost of applying to school $j$, and $H$ is the total budget to spend on applications.

저희의 모형에서, $m$개의 대학교가 존재하는 대학 시장에서 단 한 명의 학생의 의사결정에 집중하기로 했습니다. 각 학교에 대해, 이 학생이 합격하는 확률 $f_j$가 주어집니다. 저희는 $f_j$를 외생변수로 모형화를 했지만, 실제 학생한테 이 문제를 적용하려면 그의 수능 점수, 내신 등의 학생 정보를 가지고 $f_j$를 추정할 수 있습니다. 중요한 것은, $f_j$는 학교 $j$의 합격률은 아닙니다. 이값은 바로 어떤 정해진 학생의 입학 확률을 의미합니다. 그에 해당하는 Bernoulli 확률 변수 $Z_j$는 그럼, 학생이 합격하면 1, 합격 못하면 0의 값을 가지게 되고, 모든 $Z_j$가 확률적으로 독립하다고 가정합니다. 그러면, 학생이 결정해야 하는 것은 바로 ‘어디’에 지원하는 것입니다. 학생이 지원하는 학교 집합, 즉 그의 ‘지원 포트폴리오’를 $\mathcal{X}$라고 합니다. 지원 행동에 다양한 비용이 있기 때문에 모든 학교에 지원할 수 없고, 본 연구에서 배낭 제약식이 있는 상황을 고려합니다. 이때 $g_j$는 $j$번째 학교에 지원하는 비용을 의미하고, $H$는 지원에 지불할 수 있는 총 예산입니다.

Let’s continue building our model by introducing a notion of utility. For each school, we have a nonnegative utility parameter $t_j$ which represents the utility that the student receives if she goes there, and we assume that the student gets $0$ utility if she gets in nowhere. Now, the utility that the student experiences from the college admissions process is whatever the $t_j$-value is for the school she actually attends, that is, the best school to which she both applies and is admitted. We refer to the expected maximum over the $t_j Z_j$s as the application portfolio’s valuation, notated $v(\mathcal{X})$.

모형을 완성하기 위해 효용의 개념을 도입해 보겠습니다. 각 학교에 대해, $t_j$는 학생이 그 학교에 진학하면 발생하는 효용을 의미합니다. 어떤 대학에도 합격하지 않는 경우, $0$의 효용이 발생한다고 가정할 수 있습니다. 이제 전체 대학 입학 과정을 통해서 학생에게 발생하는 효용은, 그가 실제로 진학하는 학교, 즉 지원을 하고 합격을 하는 학교 중, 가장 좋은 학교에 해당하는 $t_j$값입니다. $t_j Z_j$의 기대 최댓값을 지원 포트폴리오의 ‘가치’라고 부르고 $v(\mathcal{X})$처럼 표기하겠습니다.

To put $v(\mathcal{X})$ into some sort of tractable form, we introduce the function $p_j(\mathcal{X})$, which gives the probability that the student actually enrolls $c_j$. This will happen only if she applies to $c_j$, gets into $c_j$, and does not get into any of the schools she likes better than $c_j$. Now the expression for $p_j(\mathcal{X})$ as is shown on the screen. By taking the inner product with $t$, we get the student’s overall expected utility. It is this final function that we will seek to maximize.

그러면 $v(\mathcal{X})$를 계산할 수 있는 함수 형태로 나타내기 위해, $p_j(\mathcal{X})$라는 함수를 먼저 정의해봅시다. 이것은 학생이 실제로 학교 $j$에 진학할 확률을 의미하며, 그 조건은 $c_j$에 지원하고, $c_j$에서 합격하고, 또한 $c_j$보다 좋아하는 학교에서 모두 합격하지 않았을 때입니다. 그러면 $p_j(\mathcal{X})$를 화면처럼 표현할 수 있습니다. 이때 $t$와의 내적은 계산하면 학생의 기대 효용이 나옵니다. 이 함수를 최대화하는 것은 대학 입학 지원 최적화 문제입니다.

Here is a concise expression of the college application problem. We will work mainly with the first form, in which the decision variable is the set $\mathcal{X}$. One can show that this objective function is nondecreasing and submodular. The college application problem can also be expressed as an integer optimization problem. We observe that the integer NLP form has a polynomial objective function of degree $m$. It is neither concave nor convex. So, now we know the problem formulation—any questions?

대학 지원 문제를 간단하게 정리하자면 화면과 같습니다. 저희는 주로 첫번째 모형을 다루겠습니다. 여기서 결정 변수는 집합 $\mathcal{X}$가 되고, 이 목적함수가 단조 submodular 집합 함수인 것을 보일 수 있습니다. 그런데 대학 지원 최적화 문제는 정수 비선형 계획으로도 표현할 수 있습니다. 하지만 정수 NLP 형태는 $m$차 다항식의 목적함수를 가지고, 이것이 오목도 아니고 볼록도 아닌 것을 확인할 수 있습니다. 지금까지 문제의 기본 모형에 대해서 말씀드렸는데, 질문이 있으신가요?

## The status quo
Let’s consider the status quo in college application.

그러면, 이 문제의 현재 상황을 좀 정리해봅시다.

In Korea as well as in the US, there is a lucrative industry called “college admissions consulting.” It involves estimating students’ admissions probabilities, coaching them on standardized tests, helping them produce their application materials, and finally, deciding where to apply. If you read marketing materials from these companies, they often invoke the idea of safety schools, which are schools that have low utility but are relatively easy to get into, and reach schools, which are highly selective but highly desirable, and target schools, which are somewhere in between. A common belief is the idea that you should a roughly even mix of these three. This is a very legible heuristic, but is it accurate? What does the evidence show?

전세계적으로 소위 ‘입학 컨설팅’이라는 것은 수익성이 높은 산업입니다. 입학 컨설팅 회사에서, 학생의 합격 확률을 추정하고, 입시 코칭도 해주고, 원서를 작성하는 것을 도와주고, 마지막으로 어디에 지원할지 결정하는 데에 상담하고 있습니다. 입학 컨설팅 회사의 홍보 자료를 찾아 보시면 자주 나오는 말은, 효용은 낮은데 붙기가 쉬운 ‘안정 지원 학교’하고, 붙기가 어려운데 효용이 높은 ‘상향 지원 학교’하고, 그 사이에 있는 ‘소신 지원 학교’라는 세가지 범주로 학교들을 나눕니다. 이때 안정, 소신, 그리고 상향 지원 학교에 대략 균일하게 지원하는 것이 좋다는 것은 일종의 통념입니다. 이것은 아주 이해하기 쉬운 휴리스틱이지만, 이것에 대한 근거같은 게 있을까요?

I’m now going to give you a chance to try making your own application strategy. This picture shows an arguably typical college market. We’ve plotted the admissions probability on the x-axis, and the utility on the y-axis. If, for example, a school were in the top right, then that would be a school that you can easily get into and that you really like—so you should obviously apply there. But in the typical scenario, schools like that don’t exist. Instead, there is correlation between attractiveness and selectiveness. In this picture, then, we can identify schools on the top left as “reach schools,” and those on the bottom right as “safety schools.” Now, let’s suppose that all the schools in this picture have the same application cost, so that we are working with essentially a constraint on the number of schools we can apply to. If you can only choose three schools, which three will you pick?

이제 지원 전략 짜는 것을 연습하실 수 있는 기회를 드리겠습니다. 이 그림에서 어떻게 보면 ‘전형적인’ 대학 시장이 등장합니다. x측에는 어떤 학생의 합격 확률이 있고, y측에는 효용이 있습니다. 그러면 만약에 어떤 학교가 오른쪽 위에 있다면, 그것은 쉽게 붙이는 학교이고, 또한 아주 좋아하는 학교가 되니까 당연히 지원을 하겠습니다. 그런데, 보통 같으면 그런 학교는 존재하지 않습니다. 대신 학교의 ‘매력’과 ‘경쟁성’이 그림처럼 비례합니다. 여기서 왼쪽 위에 있는 학교를 ‘상향’ 지원 학교, 그리고 오른쪽 아래에 있는 학교를 ‘안정’ 지원 학교로 볼 수 있습니다. 그러면, 편의상 이 그림에서 나타나는 모든 학교의 지원 비용이 동일하다고 가정합시다. 즉, 배낭 제약식 대신 지원할 수 있는 학교의 개수만 제한됩니다. 이 중에서 3개의 학교만 선택하신다면, 어디를 선택하시겠습니까?

Taking a look at the optimal solution, we can see first that the schools lie on a sort of efficient frontier. This makes sense: a school that’s in the interior of the distribution is trivially dominated by schools to the upper right of it, which have both higher utility and better admissions odds. We also that three schools chosen are spread out, rather than close together. One could reasonably label them as reach, target, and safety schools. So perhaps the admissions consultants aren’t entirely off base.

이 모형이 유도하는 실제 최적해를 보게 되면, 우선 지원하는 학교들은 어떤 효율적 투자선에 앉아 있는 것을 먼저 관찰합니다. 일리가 있는 결과이죠. 분포의 내부에 있는 학교를 택한다면, 그의 오른쪽 위에 있는 학교는 효용도 높고 합격 확률도 높으니까 우위를 받습니다. 그리고, 선택된 3개의 학교는 같이 모여 있지 않고, 어느정도 펼쳐 있습니다. 상향, 소신, 안정 지원 학교로 라벨을 쉽게 붙일 수 있습니다. 그런 점에서 보면 입학 컨설턴트의 아이디어는 좀 유력해 보일 수 있습니다.

We can call this reach/safety school strategy a kind of “distributive heuristic.” It tells you that the schools in your portfolio should vary in their risk characteristics. However, it doesn’t specify exactly where the boundary is between a reach school and a target school and a safety school. Moreover, regardless of how you define a safety school, we argue in our paper that this distributive heuristic actually ends up being unnecessarily risk averse when the application budget is large. As an alternative, another heuristic we might propose is the “linearization heuristic.” The idea here is, if you apply to just one school, then the expected utility is $f_j t_j$, so why not use that as the coefficient in a linear objective function and solve the corresponding knapsack problem? Nevermind that the knapsack problem is NP-complete, this solution can be an arbitrarily poor fit for the college application problem, as we show by pathological example. Finally, we mention that when a problem similar to arose in an equilibrium analysis of the American college market, the author resorted to enumeration. But we want to solve larger problems, so we derived algorithms that are both tractable in terms of computation time, and have guaranteed accuracy.

저희는 이런 상향, 소신, 안정 지원 전략을 ‘배분적 휴리스틱’이라고 부릅니다. 위험 성질이 다양한 학교들을 포트폴리오에 포함해야 한다고 의미합니다. 그런데 이 휴리스틱을 사용하면 상향, 소신, 안정 지원 학교 사이의 경계가 어디에 있는지가 정의되진 않는게 단점입니다. 또한, 그 경계를 어떻게 정의한다고 해도, 지원할 수 있는 학교의 개수가 높을 때, 즉 지원 예산이 많을 때, 배분적 휴리스틱이 과도하게 위험 회피적인 것을 해석적으로 보일 수 있습니다. 그다음으로, 논문에서 ‘선형화 휴리스틱’이란 다른 휴리스틱도 고려합니다. 선형화 휴리스틱의 기본 생각은, 학교 하나만 지원하면, 그 기대 효용은 $f_j t_j$입니다. 그러면 선형 목적 함수에 이를 각 학교의 가중치로 도입하고 해당 배낭 문제를 대리 문제로 풀 수 있습니다. 배낭 문제 그자체가 NP-complete한 것은 물론이고, 게다가 이런 휴리스틱을 대학 지원 문제에 적용하면 최적해에 비해 아주 안 좋은 해를 출력하는 예시를 만들 수 있습니다. 따라서 만족스러운 알고리즘이 아닙니다. 마지막으로, 미국 대학 시장의 균형 분석을 한 선행 연구 중에서, 저희 문제하고 비슷한 부문제가 등장한 사례가 있는데 그때 열거법으로 풀었다고 합니다. 저희는 큰 인스턴스를 풀고 싶기 때문에, 계산 시간 입장에서도 효율적이고, 또한 정확도가 보장된 알고리즘을 제시하는 게 본 연구의 목표였습니다.

## Our algorithms
Next, we will be taking a look at our solution algorithms.

이제 저희가 제시하는 해법을 설명하고자 하겠습니다.

In our paper, we treat two cases of the college application problem separately. First, we consider a special case called Alma’s problem which admits a polynomial-time algorithm. Next, we turn to the general case, called Ellis’s program. We prove that this problem is NP-complete, and provide a variety of solution algorithms. Among them, perhaps the most important contribution is the fully polynomial-time approximation scheme or FPTAS. In general, it is known that an FPTAS cannot exist for general submodular maximization, so the fact that one exists for Ellis’s problem is a somewhat meaningful result.

논문에서 대학 지원 문제를 두가지 케이스로 나눠서 분석합니다. 먼저 알마의 문제라고 부르기로 한 특수한 경우를 고려하는데 이때 다항 시간 해법이 존재합니다. 그 다음에 엘리스 문제라고 부르는 일반 문제로 넘어갑니다. 엘리스 문제가 NP-complete한 것을 증명하고 다양한 해법을 제시합니다. 그 중에서 아마 가장 흥미로운 것은 완전 다항 시간 근사 해법, 즉 FPTAS입니다. 일반적인 submodular 최대화 문제에 대해서 FPTAS가 존재하지 않는 것이 알려져 있으므로, 이것이 대학 지원 문제에 존재한다는 것은 어느 정도 의미있는 결과입니다.

First, let’s focus on the special case of Alma’s problem, which is polynomially solvable. This is the case we saw earlier, where instead of heterogeneous application costs, we have simply a cardinality constraint on the number of applications we can submit. This is similar to the Korean admissions process, in which there is not application fee, but you cannot apply to more than three schools in the main admissions cycle. In this special case, because $H$ refers to a number of schools rather than total expenditures, we can assume that $h < m$, and to reflect this change in meaning, we write $h$ in lowercase. This is an instance of “submodular maximization over a cardinality constraint,” and a classic result says that the greedy algorithm is a good approximation. We show a stronger result for college application: the same greedy algorithm is, in fact, exact. We also improve its computation time. 

다항 시간에 풀 수 있는 특수한 경우, 알마의 문제를 먼저 보겠습니다. 이것은 아까 본 그림처럼 배낭 제약식 대신 지원 포트폴리오의 크기만 제한되는 경우이며, 지원 비용은 없지만 정시 모집 기간에 학교 3개만 지원할 수 있는 한국 입학 과정과 비슷한 상황입니다. 이 케이스에서, $H$는 단순히 학교의 개수를 의미하므로, $h$가 $m$보다 작다고 가정할 수 있고, 그것을 강조하기 위해서 소문자로 표기하겠습니다. 그러면, 집합 크기 제약 위에서 submodular 함수를 최대화하는 문제인데, 고전적인 결과에 따라 이런 상황에서 탐욕 해법이 좋은 근사 해법이 되는 것이 이미 알려져 있습니다. 그런데, 알마의 문제에 대해서, 저희는 같은 탐욕 해법이 실제로 정확한 해법이 된다는 좀 더 강한 결과를 보일 수 있습니다.

Here’s why. In Alma’s problem, the optimal portfolios have a special structure: When the application limit increases from $h$ to $h+1$, the optimal application portfolio is formed by just adding one school to the one before it. We call this the “nestedness” property, and it implies that a greedy algorithm that adds schools one at a time is optimal. In the algorithm, we recycle a variable-elimination technique from the proof of the nestedness property that enables us to reduce the computation of the objective function to amortized unit time. This brings the overall computation time down to a quadratic. 

그 이유를 살펴보자면, 알마의 문제에서, 최적 포트폴리오는 특별한 구조를 가지기 때문입니다. 지원 제한이 $h$에서 $h+1$로 늘어날 때, 새로운 최적 포트폴리오는 그 전의 최적해의 확장 집합입니다. 이것을 ‘포함 사슬 관계’, 즉 nestedness 성질이라고 부르며, 목적 함수를 가장 많이 증가시키는 학교를 차례대로 포트폴리오에 추가하는 탐욕 해법이 정확하다고 의미합니다. 목적 함수를 계산하는 시간은 원래 $O(m)$인데, nestedness 성질의 증명 과정에서 개발한 변수 소거법을 적용하면 목적함숫값을 환산 단위 시간으로 계산하고 최적해를 이차 시간에 구하는 해법을 제시할 수 있었습니다. 

Now, let’s look at the general problem. The first order of business is to show that it is NP-complete. By setting the admissions probabilities to a very small number, the objective function becomes almost linear, which enables us to encode arbitrary knapsack instances as instances of Ellis’s problem. Thus, Ellis’s problem admits no polynomial-time algorithm unless P=NP. Instead, we offer four algorithms that come with various pros and cons. The first is a branch-and-bound scheme; while our implementation is not the most effective algorithm of the four, the linear relaxation we provide could be used as the basis for a more competitive algorithm. The second is a dynamic program that iterates on the total portfolio expenditures. This algorithm is exact, and runs in pseudopolynomial time in $m$ and $H$. Next, we use a different dynamic program based on rounding the portfolio valuations down to a fixed-point decimal to derive a fully polynomial time approximation scheme, or FPTAS. Finally, for comparative purposes, we also outline a simulated annealing heuristic which offers no approximation guarantee but is very good in practice.

그 다음에 엘리스의 문제라는 일반적인 상황으로 넘어가겠습니다. 먼저 이 문제의 NP-completeness를 증명해봤습니다. 어떻게 했냐면, 입학 확률이 아주 작을 때, 대학 지원의 목적 함수는 선형 함수에 가까워집니다. 따라서 임의의 배낭 문제 인스턴스를 엘리스 문제의 인스턴스로 인코딩할 수 있습니다. P가 NP와 같지 않은 한, 엘리스 문제의 다항 시간 해법이 존재할 수 없다고 의미합니다. 대신 다양한 장단점이 있는 4가지 알고리즘을 제시합니다. 첫째는 branch and bound 알고리즘입니다. 효율성이 좀 낮은 해법이지만, 저희가 제시한 선형 완화 문제를 이용해서 이 알고리즘을 개선할 수 있는 방법이 많습니다. 둘째 알고리즘은 총 지원 지출액으로 탐색하는 동적 계획입니다. 정확한 해법이며, 그의 계산 시간은 $m$과 $H$의 다항식을 넘지 않으므로 의사 다항 시간 해법입니다. 그다음에, 포트폴리오 가치를 고정소숫점으로 내림하는 또다른 동적 계획이 있습니다. 라운딩의 정확도를 조정하면 해법의 정확도를 원하는 만큼 늘릴 수 있으므로 이를 통해서 FPTAS를 이뤄낼 수 있었습니다. 마지막으로, 다른 알고리즘을 비교하는 목적으로 simulated annealing 기반 휴리스틱 알고리즘을 제시하며, 정확도는 보장되지 않지만 가상 인스턴스에 대한 성능이 좋았습니다.

As the details of the branch-and-bound algorithm are fairly unremarkable, I have omitted it from this presentation. However, if you are interested in the linear relaxation problem, I have a few slides in the appendix that I can elaborate on.

저희 branch-and-bound 해법은 그렇게 특별하거나 놀랍지가 않아서 일단은 넘어가겠습니다. 그런데 이에 대한 발표 자료를 준비해서 부록에 포함했으니까, 이 해법이 사용하는 선형 완화 문제에 대해 궁금하시면 나중에 설명드리겠습니다.

Our first algorithm, then, is a dynamic program that is both exact and very efficient for certain instances. The design is similar to a familiar DP for the knapsack problem: We define $V[j, h]$ as the value of the best portfolio that satisfies a restricted budget and uses only the first $j$ schools. The values of $V[j, h]$ satisfy a recursion relation which appears on the screen, and by filling a table with these values and then iterating backwards over the table, it is not difficult to determine the optimal portfolio. Because the computation time depends on $H$, this is not a polynomial-time algorithm. However, in typical college applications, the application costs are small integers, and in that case this algorithm is quite practical.

그러면, 오늘의 첫번째 해법을 보자면, 어떤 인스턴스에 대해서는 아주 효율적인, 정확한 동적 계획이 있습니다. 이 알고리즘의 구성은 배낭 문제의 익숙한 동적 계획과는 매우 비슷합니다. 먼저 $V[j, h]$를, 제한된 예산 조건을 만족하면서 첫 $j$개의 학교만 사용하는 최적 포트폴리오로 정의합니다. $V[j, h]$의 값은 화면과 같은 재귀 관계를 만족합니다. 이 값들을 표에 채우고, 표를 거꾸로 탐색하면 최적 포트폴리오를 구할 수 있습니다. 이것의 계산 시간은 $H$에 의존하므로 다항 시간 해법이 아닙니다. 그런데, 전형적인 대학 지원 인스턴스에서, 지원 비용이 작은 정수가 되는 경우가 많은데 이때 아주 현실적인 알고리즘이 됩니다.

Next, we discuss the FPTAS, which is based on a different dynamic program. It also bears similarity to the famous FPTAS for the knapsack program. The idea here is to approximate portfolio valuations as a fixed-point decimal, and calculate them by adding the schools one at a time and always rounding the decimal down. The set of portfolio valuations $\mathcal{V}$ that can be observed in this fixed-point environment is therefore finite. Using binary search to find the largest element of $\mathcal{V}$ that admits a feasible solution, we can find a portfolio that is optimal up to fixed-point error.

그다음에, 저희 FPTAS에 대해 말씀드리겠습니다. 이것은 또다른 동적계획 기반으로 구성된 알고리즘이며, 배낭 문제의 유명한 FPTAS하고 유사한 점이 많습니다. 이 해법의 원리는 포트폴리오의 가치를 계산할 때, 학교들을 지표 순서대로 추가하고, 학교를 추가할 때마다 포트폴리오의 가치를 고정소숫점 십진수로 내림하기입니다. 십진수만 고려하므로, 고정소숫점 환경에서 발생할 있는 포트폴리오 가치의 집합은 화면에서 나오는 $\mathcal{V}$같은 유한 집합입니다. 이 유한 집합에다 이진 검색을 적용하면, $\mathcal{V}$의 원소 중에서 “가능한 포트폴리오가 존재하면서 가장 큰” 가치를 선택하면, 근사 최적 포트폴리오를 구할 수 있습니다.

To iterate over $\mathcal{V}$, we need to relate the portfolios associated with each of its elements using a recursion relation. The validity of this recursion relation is not difficult to understand, but it involves taking a lot of subcases, so I will refer you to the paper for the details. The important thing is the accuracy of the approximation depends on $P$, the precision of the fixed-point decimal environment. We show how to set $P$ to ensure that the optimality gap is less than $\varepsilon$. When you do this, the size of the table, and therefore the overall computation time, is polynomial in $m$ and $1/\varepsilon$, which is precisely the condition for an FPTAS.

그런데, $\mathcal{V}$를 탐색하기 위해, 원소에 대등되는 포트폴리오들을 어떤 재귀 관계를 통해서 묘사할 수 있습니다. 화면에서 나오는 재귀 관계의 타당성은 쉽게 이해하실 수 있겠지면, 케이스를 많이 나눠야 돼서 발표 자료에서 그 설명을 생략했습니다. 중요한 것은, 근사 최적해의 정확도는 고정소숫점의 뒷자리 개수 $P$로 정해지는 것입니다. 그러면 근사 계수가 최소한 $1 - \varepsilon$이 되도록 $P$를 설정할 수 있으며, 이렇게 설정할 때 재귀 관계가 정의된 지표의 개수가 $m$ 그리고 $1/\varepsilon$의 다항식을 넘지 않는 것을 보일 수 있습니다. 따라서 계산 시간도 그런 다항식 상한을 가지고, 이것이 바로 FPTAS의 조건입니다.

The final algorithm given in our paper is a simulated annealing algorithm which is primarily of comparative interest. Simulated annealing is a neighborhood search technique, and although it offers no guarantee of accuracy, its computation time is very fast. Simulated annealing algorithms are therefore popular in real-time disciplines, such as vehicle routing, where the absolute accuracy of a solution is considered less important than getting a “good enough” solution very quickly. The basic ingredients for simulated annealing are as follows: We need an initial solution; in our case, we use the linearization heuristic. And we need a randomized procedure for generating neighbors; in our case, we randomly add then remove schools in a way that preserves feasibility. Finally, there are a couple of parameters that control how “aggressively” SA changes candidates; we used a simply grid search to determine parameter values that worked well on our test data.

논문의 마지막 알고리즘은 simulated annealing 알고리즘입니다. Simulated annealing이라는 것은 일종의 지역 탐색 휴리스틱인데 정확도는 보장되지는 않지만 계산 시간이 아주 빠른 해법입니다. 그 이유로 절대적인 정확도보다 소위 말해서 ‘충분히 좋은’ 해를 실시간으로 찾아야 되는 vehicle routing 같은 분야에서 인기가 많은 기법입니다. SA의 기본 재료는 다음과 같습니다. 먼저 초기해가 필요한데, 대학 지원 문제에서 저희는 선형화 휴리스틱으로 잡았습니다. 그 다음의 후보해의 이웃해를 생성하는 기법을 정의해야 하는데, 저희는 포트폴리오의 가능성을 유지하면서 학교를 무작위로 추가하고 빼는 방법을 이용했습니다. 마지막으로 SA가 후보해를 얼마나 쉽게 바꾸는지를 결정하는 모수들이 있는데, grid 탐색을 통해 가상 데이터에서 성능이 좋은 값을 구했습니다.

## Computational results
For the remainder of the presentation, we will discuss the results of our computational experiments.

남은 발표에서 계산 실험 결과를 간단히 정리하도록 하겠습니다.

We conducted three experiments to test the efficiency and accuracy of our solution algorithms. In all three experiments, we use this recipe to generate problems of various sizes. $t_j$ and $f_j$ are chosen to correlate negatively, which makes the problem more difficult by requiring a choice between safety and reach schools. The budget is set so that roughly half of the schools will end up in the optimal portfolio. As for the implementation, we coded all of our algorithms in the Julia language. In fact, the OptimalApplication.jl package was recently accepted into the public Julia registry, so if you know Julia, you can install this package easily and try it out yourself.

해법의 효율성과 정확성을 확인하고자 3개의 계산 실험을 진행했습니다. 모든 실험에서 화면에서 나오는 레시피로 가상 인스턴스를 생성했습니다. 먼저 $t_j$와 $f_j$를 서로 반비례하도록 생성했으며, 안정 지원 학교와 상향 지원 학교 중에서 선택하게 하므로 좀 어려운 인스턴스를 만드는 방법입니다. 그리고 학교 중 반쯤이 최적 포트폴리오에 포함되도록 예산을 설정했습니다. 알고리즘을 구현하기 위해서는, 저희는 Julia 언어로 모든 알고리즘을 코딩을 했습니다. 안그래도, 저번주에 OptimalApplication.jl이라는 이름으로 저희 패키지가 온라인 패키지 등록에 합격받아서, Julia를 아신다면 이 패키지를 설치하시고 직접 사용해보실 수 있습니다.

Experiment 1 compares two data structures, namely the array and the heap, for Alma’s problem. These have the same order of complexity, but due to constant factors, the array implementation is much faster.

실험 1은 알마 문제의 탐욕해법을 고려하며 배열 그리고 힙 같은 두가지 데이터 구현을 비교했습니다. 두 해법의 계산 시간 복잡도는 같지만, 보시다시피 배열 구현은 현실적으로 더 빠릅니다.

Experiment 2 considers the speed of the algorithms for Ellis’s problem. We excluded the simulated annealing algorithm from this experiment because it isn’t really a good target of comparison with the other algorithms: its computation time is much faster, but it offers no accuracy guarantee. Among the remaining algorithms, the first dynamic program—the one that iterates on application costs—is the fastest. In part, this is a reflection of our test data in which $g_j$ are small integers. 

실험 2는 엘리스 문제의 해법의 계산 시간을 고려하는 실험입니다. 여기서 simulated annealing 해법을 제외했습니다. 왜냐면, 계산 시간은 훨씬 따른데, 정확도가 보장되지 않으니까 다른 해법의 비교 대상이 될 수 없기 때문입니다. 그럼 남은 해법 중에서, 표에서 보시다시피 지원 비용으로 탐색하는 첫 동적 계획이 우월한 성능을 보였습니다. 실험 데이터에서 $g_j$들이 작은 정수가 되므로 놀라운 결과는 아닙니다.

Finally, in experiment 3 we compare the solution produced by the simulated annealing algorithm with the true optimum in 500 instances. As you can see from this scatter plot, in the vast majority of instances, SA found a solution within 2% of optimality, and its performance appears to improve in large instances.

마지막으로, 실험 3에서 simulated annealing으로 구한 휴리스틱 해법과 실제 최적해를 500 인스턴스에서 비교해봤습니다. 그림에서 나타나듯이, 대다수의 경우, SA는 98퍼센트를 넘는 정확도를 발휘했으며, 인스턴스가 크면 클수록 정확도가 늘어나는 현상이 있습니다.

## Conclusion
Let’s move onto the conclusion.

결론입니다.

College application is an intriguing optimization problem, with its unusual “maximax” form and integrality constraint. While on its surface, it looks like a submodular maximization problem, in terms of the solution techniques and approximation results we can derive, it behaves more like the knapsack problem. And the analogy with knapsack continues in the special case, where each $g_j = 1$ and the problem can be solved in polynomial time by a greedy algorithm. Next, we note that college application is a matter of practical importance and value. Right now, if you try to hire an America college consultant, they will charge an average of 200 dollars per hour. Obviously, they do more than just solve optimization problems, but the high cost of admissions consulting services was one motivation for us to open source our code and algorithms. Finally, in the paper we propose several extensions to the model which I would be happy to take questions about. Thank you.

목적함수의 maximax 형태 그리고 정수 조건 때문에 대학 지원 문제는 방법론적으로 흥미로운 최적화 문제라고 생각합니다. 표면에는 어려운 submodular 최적화 문제처럼 보이지만, 알고리즘의 구조와 근사 해법의 존재성을 보니까 그의 난이도는 배낭 문제에 더 가깝습니다. 그다음에, 대학 지원이라는 것에는 실제적인 중요성과 가치 있다고 생각합니다. 지금, 미국 입시 컨설턴트에게 문의해보시면, 시간당 24만원의 급료를 청구할 수 있습니다. 물론, 입학 컨설턴트는 최적화 문제를 푸는 거 외에도 많은 서비스를 제공하지면, 입학 컨설팅의 높은 비용을 반영하여 이 연구를 하면서 개발한 코드를 open-source license로 공개하기로 했습니다. 마지막으로, 논문에서 이 모형에 대한 여러가지 확장을 제안하는데, 혹시 궁금하시면 질의시간에 더 설명드리고자 하겠습니다. 감사합니다.

<!-- ko: 25:02 -->

## Appendix

### Summary of algorithms

### Small example

### Branch-and-bound overview

Our branch-and-bound algorithm is fairly straightforward. We work with the INLP formulation of the college application problem, and use this linear relaxation to obtain an upper bound on the objective value. We tighten this LP bound by recycling the variable elimination technique from Alma’s problem. This linear relaxation is solvable in linear time.

저희의 분지한계 알고리즘은 다른 분지한계법하고 많이 다르지 않습니다. 대학 지원 문제의 INLP 형태를 사용하면, 화면과 같은 선형 완화 문제가 원문제 목적 함숫값의 상한을 제공해 줍니다. 알마 문제에서 개발한 변수 소거법을 재활용해서 이 LP 상한을 좀 더 타이트하게 조정할 수 있으며, 이 선형 완화 문제는 선형 시간에 쉽게 풀 수 있습니다.

Because we have an integer expression of the problem and a linear relaxation, we can apply any number of branch-and-bound algorithms to this problem. In our computational study, we use a very simple algorithm that selects the branch node according to a depth-first heuristic. It is, admittedly, not as good as our other algorithms. But we have written our code library in a modular fashion so that the same LP relaxation can be passed to a more sophisticated branch-and-bound solver. This is useful because one of our ideas for future research is to consider more complex constraint structures.

이제 원 문제의 정수 모형, 그리고 완화 문제 둘 다 정의했으니까 정수계획 문헌에서 다채로운 분지한계 알고리즘을 도입할 수 있습니다. 저의 계산 실험에서는, 깊이 우선 분지 마디 선택 휴리스틱을 도입한 아주 간단한 해법을 사용하기로 했으며, 그의 계산 시간 다른 해법에 비해 그리 좋지 않습니다. 그렇지만, 저희 코드에서 부문제들을 아주 modular한 식으로 구성했기 때문에, 기존에 좋은 분지한계 솔버하고 interface하게 하는 것은 어렵지 않습니다. 왜 그게 필요하냐면, 향후 연구 중에서 더 복잡한 제약 조건을 고려하는 목표가 있는데 이때 분지한계법을 사용할 수밖에 없을 가능성이 있습니다.

## Foreseeable questions

Is this model too simplistic? Discuss the validity of this model with respect to the Korean admissions process.

  - There are many modifications that could make this model more realistic. For example, in the Korean admissions process, there are “diversification constraints” that prevent you from applying to certain pairs of schools. We can also think about adding a variance penalty to model students’ risk aversion. However, as argued in the paper, our algorithms for the basic problem discussed here can be used as the basis for solution methods for these more complex scenarios.

	Moreover, the college application problem is ultimately just a name for this optimization problem. Like the knapsack problem or newsboy problem, it can arise in a variety of operational contexts, and making the problem excessively specific to college application would limit its universality.

  - 이 모형을 좀 더 현실적으로 만드는 방법이 있습니다. 예를 들면, 한국 입학 과정에서 가나다군이 있어서 추가적인 제약 조건이 생깁니다. 또한 학생 개개인의 위험 회피를 반영하기 위해서 표준편차 페널티를 추가하는 것도 유리할지 모르겠습니다. 그런데 저희가 고려해온 간단한 문제의 해법이 있으면, 그것을 섭루틴으로 사용해서 이런 좀 더 세련된 문제를 풀 수 있습니다.

  	또한, 입학 지원 문제라는 것은 사실 이 최적화 문제의 이름일 뿐입니다. 배낭 문제나 newsboy 문제처럼, 그 문제를 응용할 수 있는 데가 많은데, 대학 지원하는 것만 생각해서 문제를 너무 특정하게 만들면 포괄성이 손해되는게 단점입니다.
  
Describe how the branch-and-bound algorithm could be improved.

  - On an abstract level, a branch-and-bound algorithm is highly modular: All you need is an efficient way to generate upper bounds for constrained subproblems (the “bound” subroutine) and some good heuristics for choosing which subproblem to investigate next (the “branch” subroutine). As these two routines have no interaction with each other, if you find a way to improve one, you can easily substitute it in. Our linear relaxation is a fractional knapsack problem, which can be solved in linear time, so we already have a good bound subroutine. Our branch subroutine, on the other hand, is very naive: we just branch on the subproblem with the highest dual bound. There are better heuristics out there, such as “tree diving,” that tend in practice to explore the tree more efficiently, and we can use abstract solvers like Bonobo.jl to steal branch heuristics from somewhere else. This will let us solve more advanced constraint structures.

  - 아주 높은 관점에서 보면, branch and bound 알고리즘은 굉장히 modular한 해법의 구조입니다. 부문제의 상한을 계산해주는 bound subroutine, 그리고 어느 부문제를 탐구할지 결정해주는 branch subroutine: 이런 2개의 component만 있으면 됩니다. 그리고 둘이 서로 독립하니까 하나를 개선하면 자유롭게 대체할 수 있습니다. 저희의 선형 완화 문제를 분수 배낭 문제인데 이거를 선형시간에 풀 수 있으므로 bound routine은 이미 최적화가 됐습니다. 그런데 저희가 사용한 branch routine은 상당히 naive한 해법입니다. 그냥 상한이 가장 높은 마디를 선택합니다. 이것보다 tree diving 같은 좋은 휴리스틱들이 존재하며 이를 도입하면 부문제 나무를 더 효율적으로 탐색할 수 있습니다. Julia 생태계에는 Bonobo.jl이라는 패키지가 있는데, 이것은 branch 그리고 bound 루틴의 중개인으로 기능해서, 이걸로 다른 개발자한테서 좋은 branch routine을 빌릴 수 있습니다. 그렇게 하면 더 복잡한 제약 조건도 쉽게 도입할 수 있겠죠. 
  
Why does the simulated annealing algorithm get better as the problem size increases?

  - The objective function in this problem exhibits rapidly diminishing marginal returns. This means that if there are many schools in the optimal portfolio—as is the case in our test instances—then all of the solutions that use most of the budget actually attain a very similar objective value. And unlike other combinatorial optimization problems, finding a feasible solution is quite easy in this case. This result probably holds for submodular maximization in general, because diminishing marginal returns is an innate feature of these functions.

  - 대학 지원 문제의 목적 함수는 학교를 추가하면 추가할수록 한계 효용이 급속히 감소되는 현상이 있습니다. 따라서 저희 가상 인스턴스처럼 최적 포트폴리오에 포함된 학교가 많을 때, 지원 예산을 다 사용하기만하면 사실 가능한 포트폴리오들의 목적함숫값이 비슷비슷합니다. 그리고 다른 조합 최적화 문제에 비해, 여기서 가능해를 구하는 것도 어렵지 않습니다. 일반적으로, 이런 한계 효용 절감 현상이 submodular 함수의 기본적인 성격이하러, 아마도 다른 submodular 함수에다 simulated annealing를 적용하면 비슷한 결과가 발생할 것 같습니다.

Why did you choose the Julia language?

  - Julia has a feature called multiple dispatch that makes it easy to write code that can accept a variety of user input—for example, users can input their utility as a float or an integer and the algorithms remain type-stable. Also, Julia has convenient macros that made it easy to parallelize our computational experiment at a high level, increasing the number of samples we could use in the performance benchmark.

  - Julia는 multiple dispatch이라는 기능이 있는데, 사용자가 입력 데이터를 정수 혹은 이동 소숫점 숫자로 입력했을 때 ㅡ그 상황으로 최적화된 코드가 따로 컴파일이 된다고 의미합니다. 그래서 성능의 손실없이 좀 더 일반적인 interface를 만들 수 있습니다. 그리고, 계산 실험했을때, 평행 계산을 이용하면 훨씬 큰 실험을 할 수 있고, Julia는 코드를 평행화하기 쉽게 하는 macro들이 있어서 좋습니다.
