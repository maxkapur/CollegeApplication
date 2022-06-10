# The College Application Problem

Max Kapur

-------

Hello, my name is Max, from the Management Science/Optimizaton Lab. Today I will be speaking about our research into a combinatorial optimization problem that we call the college application problem.

안녕하세요. 경영과학/최적화 연구실의 맥스라고 합니다. 오늘 발표에서는, '대학 지원 최적화 문제'라고 부르는 조합 최적화 문제에 대한 저희의 연구를 소개해 드리고자 하겠습니다. 

To the best of our knowledge, we are the first to study this problem systematically. In a nutshell, this problem involves purchasing a portfolio of random variables having the maximal expected maximum value subject to a budget constraint. The word "maximum" appears there twice on purpose, which gives this problem a unique mathematical form. Our problem spans several methodological universes. First, it's a kind of asset allocation problem, in the sense that you are buying products based on uncertain information about their utility, and have to manage the attendant risk/reward tradeoff. Second, this problem generalizes the knapsack problem, meaning that is is NP-complete, and if we want an efficient solution, we have to settle for approximation methods based on combinatorial techniques. Finally, we note that the objective function is submodular, although our approximation results are stronger than those for general submodular maximization. Today's presentation will focus on understanding the building blocks of this problem and discuss the algorithms somewhat briefly.

저희가 알기로는 이 문제를 체계적으로 분석하는 것은 처음입니다. 문제를 한 문장으로 요약하자면, 예산 제약식 하에서, 여러 확률 변수를 구매하는 문제인데, 그것의 기대 최댓값을 최대화하는 문제입니다. 'max'라는 말이 두번 나타나는데, 이것 때문에 문제의 수리 모형이 조금 독특해집니다. 저희의 연구는 다양한 방법론에 걸쳐 있는데요. 먼저, 불확실한 정보를 가지고 상품을 구매하는 문제이므로, 일종의 포트폴리오 배분 문제로 생각할 수 있습니다. 그다음은, 이 문제는 배낭 문제의 일반적인 케이스가 됩니다. 마지막, 대학 지원 문제의 목적함수는 submodular 집합 함수입니다. 오늘 발표 내용은, 이 문제의 모형과 구성을 파악하는 것에 먼저 집중하고, 그 다음에 해법을 간단하게 요약하고자 하겠습니다. 

In our model, we restrict our attention to a single student's decisionmaking in a college market having $m$ schools. For each school, we know the student's probability of admission $f_j$. And we call the associated Bernoulli variable $Z_j$, which equals one if the student is admitted, and zero if not, to the school in question. We assume these are statistically independent. Now the student's principle decision is where to apply. We use $X$ to denote the set of schools that the student applies to, which we can call her application portfolio. The application portfolio is constrained by various costs associated with college application. We consider a single knapsack constraint, where $g_j$ is the cost of applying to school $j$, and $H$ is the total budget to spend on applications.

저희의 모형에서, $m$개의 대학교가 존재하는 대학 시장에서 단 한 명의 학생의 의사결정에 집중하기로 했습니다. 각 학교에 대해, 이 학생이 합격하는 확률 $f_j$가 주어집니다. 해당 Bernoulli 확률 변수 $Z_j$는 그럼, 학생이 합격하면 1, 합격 못하면 0의 값을 가지게 됩니다. 그러면, 학생이 결정해야 하는 것은 바로 '어디'에 지원하는 것입니다. 학생이 지원하는 학교 집합, 즉 그의 '지원 포트폴리오'를 $X$라고 합니다. 지원 행동에 다양한 비용이 있기 때문에 모든 학교에 지원할 수 없고, 본 연구에서 배낭 제약식이 있는 상황을 고려합니다. 이때 $g_j$는 $j$번째 학교에 지원하는 비용을 의미하고, $H$는 지원에 지불할 수 있는 총 예산입니다.

Let's continue building our model by introducing a notion of utility. For each school, we have a nonnegative utility parameter $t_j$ which represents the utility that the student receives if she goes there, and we assume that the student gets $0$ utility if she gets in nowhere. Now, the utility that the student experiences from the college admissions process is whatever the $t_j$-value is for the school she actually attends, that is, the best school to which she both applies and is admitted. We refer to the expected maximum over the $t_j Z_j$s as the application portfolio's valuation, notated $v(X)$.

모형을 완성하기 위해 효용의 개념을 도입해 보겠습니다. 각 학교에 대해, $t_j$는 학생이 그 학교에 진학하면 발생하는 효용을 의미합니다. 어떤 대학에도 합격하지 않는 경우, $0$의 효용이 발생한다고 가정할 수 있습니다. 이제 전체 대학 입학 과정을 통해서 학생에게 발생하는 효용은, 그가 실제로 진학하는 학교, 즉 지원을 하고 합격을 하는 학교 중, 가장 좋은 학교에 해당하는 $t_j$값입니다. $t_j Z_j$의 기대 최댓값을 지원 포트폴리오의 '가치'라고 부르고 $v(X)$처럼 표기하겠습니다.

To put $v(X)$ into some sort of tractable form, we introduce the function $p_j(X)$, which gives the probability that the student actually enrolls $c_j$. This will happen only if she applies to $c_j$, gets into $c_j$, and does not get into any of the schools she likes better than $c_j$. Now the expression for $p_j(X)$ as is shown on the screen, and if we take the inner product with $t$, we get the student's overall expected utility. It is this final function that we will seek to maximize.

그러면 $v(X)$를 계산할 수 있는 함수 형태로 나타내기 위해, $p_j(X)$라는 함수를 먼저 정의해봅시다. 이것은 학생이 실제로 학교 $j$에 진학할 확률을 의미하며, 그 조건은 $c_j$에 지원하고, $c_j$에서 합격하고, 또한 $c_j$보다 좋아하는 학교에서 합격하지 않았을때입니다. 그러면 $p_j(X)$를 화면처럼 표현할 수 있고요, $t$와의 내적은 계산하면 학생의 기대 효용이 나옵니다. 이 함수를 최대화하는 게 대학 지원 최적화 문제입니다.

Here is a concise expression of the college application problem. We will work mainly with the first form, but it can also be expressed as an integer optimization problem. We observe that the integer NLP form has a polynomial objective function of degree $m$. It is neither concave nor convex.

대학 지원 문제를 간단하게 정리하자면 화면과 같습니다. 저희는 주로 첫번째 모형을 다루겠지만, 정수 비선형 계획으로도 표현할 수 있습니다. 정수 NLP 형태는 $m$차 다항식의 목적함수를 가지고, 이것이 오목도 아니고 볼록도 아닌 것을 확인할 수 있습니다.

Let's consider the status quo in college application. In Korea as well as in the US, there is a lucrative industry called "college admissions consulting," and their standard advice involves distinguishing reach schools, which are highly selective but highly desirable, and target schools, which are somewhere in between. They recommend a roughly uniform distribution across these three types, which is a very legible heuristic, but is it accurate? What does the evidence show?

이 문제의 현재 상황을 좀 정리해봅시다. 전세계적으로 소위 '입학 컨설팅'이라는 것은 수익성이 높은 산업입니다. 거기서 자주 하는 말은, 붙기 쉬우면서 효용이 낮은 '안정 지원 학교', 그리고 효용이 높으면서 붙기가 어려운 '상향 지원 학교', 그리고 그 가운데에 있는 '소신 지원 학교' 같은 3가지 범주로 학교들을 나누고 균일하게 지원하는 것을 권장합니다. 아주 이해하기 쉬운 휴리스틱이지만, 이 것에 대한 근거같은 게 있을까요?

In our paper, we call this reach/safety school strategy a kind of "distributive heuristic," and argue that it is unnecessarily risk-averse strategy. We also discuss another heuristic called the "linearization heuristic," which is appealing but can perform quite poorly. Finally, we mention that when a problem similar to arose in an equilibrium analysis of the American college market, the author resorted to enumeration. But we want to solve larger problems, so we derived algorithms that are both tractable in terms of computation time, and have guaranteed accuracy.

저희는 이런 상향/소신/안정 지원 전략을 "배분적 휴리스틱"이라고 부르는데요. 사실, 이런 휴리스틱이 좀 위험 회피가 강한 전략이 되는 것을 보일 수 있습니다. "선형화 휴리스틱"이란 다른 휴리스틱도 논의하는데 이것의 성능도 보장할 수 없습니다. 마지막으로, 미국 대학 시장의 균형 분석을 한 선행 연구 중에서, 저희 문제하고 비슷한 부문제가 등장한 사례가 있는데 그때 열거법으로 풀었다고 합니다. 저희는 큰 인스턴스를 풀고 싶기 때문에, 계산 시간 입장에서도 효율적이고, 또한 정확도가 보장된 알고리즘을 제시하는 게 본 연구의 목표였습니다.

In our research, we have identified a special case that can be solved in quadratic time. This is the case when we have simply a cardinality constraint on the number of applications we can submit, which is similar to the Korean admissions process. On the other hand, the general problem is NP-complete, as we show by a reduction from the knapsack problem. But we offer four algorithms for this general setup. The first is a branch-and-bound scheme, which is mainly of theoretical interest. The next two are dynamic programs. One is exact and very fast on typical college application instances in which the application costs are small integers. The other is based on fixed-point arithmetic and yields a fully polynomial time approximation scheme. This is an important finding, because FPTAS's do not exist for general submodular maximization. Finally, for comparative purposes, we also outline a simulated annealing heuristic which offers no approximation guarantee but is very good in practice.

저희 연구에서, 이차 시간에 쉽게 풀 수 있는 특수한 경우 하나 발견했습니다. 이것은 지원 비용 대신 학교의 개수가 제한 되는 경우이며, 한국의 정시 입학 과정과 비슷합니다. 그 반면에, 일반 문제가 NP-complete함을 증명할 수 있습니다. 일반 상황을 위해 4개의 알고리즘을 제시합니다. 첫째는 branch and bound 알고리즘인데, 효율성보다 이론적인 흥미가 포인트입니다. 그다음은 2개의 동적 계획이 있는데요. 하나는 정확한 해법이며, 지원 비용이 작은 정수가 되는 "전형적인" 대학 지원 인스턴스에 대해 매우 효율적입니다. 다른 하나는 고정소숫점 산술을 활용한 동적 계획인데 이를 통해서 완전 다항 시간 근사 해법, 즉 FPTAS를 이뤄낼 수 있었습니다. 일반적인 submodular 최대화 문제에는 FPTAS가 존재하지 않으므로 이것은 어느 정도 의미가 있는 결과입니다. 마지막으로, 다른 알고리즘을 비교하는 목적으로 simulated annealing 기반 휴리스틱 알고리즘을 제시하며, 정확도는 보장되지 않지만 가상 인스턴스에 대한 성능이 좋았습니다. 

In summary, college application is an intriguing optimization problem, with its unusual "maximax" form and integrality constraint. While on its surface, it looks like a submodular maximization problem, in terms of the solution techniques and approximation results we can derive, it behaves more like the knapsack problem.  Next, we note that college application is a matter of practical importance and value. Right now, if you try to hire an America college consultant, they will charge an average of 200 dollars per hour. Obviously, college consultants do more than just solve optimization problems, but the high cost of admissions consulting services was one motivation for us to open source our code and algorithms. Finally, in the paper we propose several extensions to the model which I would be happy to take questions about. Thank you.

결론입니다. 목적함수의 maximax 형태 그리고 정수 조건 때문에 대학 지원 문제는 방법론적으로 흥미로운 최적화 문제라고 생각합니다. 표면에는 어려운 submodular 최적화 문제처럼 보이지만, 알고리즘의 구조와 근사 해법의 존재성을 보니까 그의 난이도는 배낭 문제에 더 가깝습니다. 그다음에, 대학 지원이라는 것에는 실제적인 중요성과 가치 있다고 생각합니다. 지금, 미국 입시 컨설턴트에게 문의해보시면, 시간당 24만원의 급료를 청구할 수 있습니다. 물론, 입학 컨설턴트는 최적화 문제를 푸는 거 외에도 많은 서비스를 제공하지면, 입학 컨설팅의 높은 비용을 반영하여 이 연구를 하면서 개발한 코드를 open-source license로 공개하기로 했습니다. 마지막으로, 논문에서 이 모형에 대한 여라가지 확장을 제안하는데, 혹시 궁금하시면 질의시간에 더 설명드리고자 하겠습니다. 감사합니다. 




<!-- 
    English times:
    
    
    Korean times:
    7:45
    15:09 for 2 runs
    7:30
    7:46
-->
