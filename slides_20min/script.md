# The College Application Problem

# 대학 지원 최적화 문제

Max Kapur

## Introduction

Hello, my name is Max. I am a grad student at SNU, and today I will be speaking about our research into a combinatorial optimization problem that we call the college application problem.

안녕하세요. 서울대 산업공학과 경영과학/최적화 연구실의 맥스라고 합니다. 오늘 발표에서는, '대학 지원 최적화 문제'라고 부르는 조합 최적화 문제에 대한 저희의 연구를 소개해 드리고자 하겠습니다.

To the best of our knowledge, we are the first to study this problem systematically. In a nutshell, this problem involves purchasing a portfolio of random variables having the maximal expected maximum value subject to a budget constraint. The word "maximum" appears there twice on purpose, which gives this problem a unique mathematical form. Today, we will explain this optimization problem and how it can be used to model the college application strategy. Then we will introduce our findings about this problem, including its theoretical properties and a variety of algorithms. While this presentation aims to be self-contained, for those who are interested in a richer methodological exposition, I would like to direct your attention to our arXiv paper; the full reference is given at the end.

저희가 알기로는 이 문제를 체계적으로 분석하는 것은 처음입니다. 문제를 한 문장으로 요약하자면, 예산 제약식 하에서, 여러 확률 변수를 구매하는 문제인데, 그것의 기대 최댓값을 최대화하는 문제입니다. 'max'라는 말이 두번 나타나는데, 이것 때문에 문제의 수리 모형이 조금 독특해집니다. 오늘의 발표에서는, 이 최적화 문제의 구성 그리고 이를 어떻게 대학 지원 전략에 적용할 수 있는지 먼저 설명해드리겠습니다. 그다음에, 이 문제에 대한 이론적인 성질 그리고 해법 알고리즘을 포함한 저의 연구 결과도 설명해드리고자 하겠습니다. 이 발표를 최대한 self-contained 하게 만들려고 노력을 했지만, 혹시 방법론적인 배경과 알고리즘의 타당성 증명에 관심있으시면 저희의 arXiv 페이퍼에 참고하시면 찾으실 수 있습니다.

Our problem spans several methodological universes. First, it's a kind of asset allocation problem, in the sense that you are buying products based on uncertain information about their utility, and have to manage the attendant risk/reward tradeoff. Second, this problem generalizes the knapsack problem, meaning that is is NP-complete, and if we want an efficient solution, we have to settle for approximation methods based on combinatorial techniques. Finally, we note that the objective function is submodular. However, our results suggest that college application is a relatively easy instance of submodular maximization.

저희의 연구는 다양한 방법론에 걸쳐 있는데요. 먼저, 불확실한 정보를 가지고 상품을 구매하는 문제이므로, 일종의 포트폴리오 배분 문제로 생각할 수 있습니다. 이때 위험과 보상의 균형을 맞추는 것이 중요한 요소입니다. 그다음은, 이 문제는 배낭 문제의 일반적인 케이스로서 NP-complete합니다. 따라서 효율적인 해법이 필요하면, 조합 최적화 기법을 이용한 근사해법을 사용할 수밖에 없습니다. 마지막, 대학 지원 문제의 목적함수는 submodular 집합 함수입니다. 그렇지만, 저희 연구 결과에 따르면, submodular 최대화 문제의 클래스 안에서 대학 지원 문제가 비교적 쉬운 인스턴스임을 확인할 수 있습니다.

## Model
Let's talk about our model.

먼저 모형을 설명해드리도록 하겠습니다.

In our model, we restrict our attention to a single student's decisionmaking in a college market having $m$ schools. For each school, we know the student's probability of admission $f_j$. For our purposes, $f_j$ is an exogeneous variable, but in an operational context, this probability is something you can estimate from students' academic records, test scores, and demographic information using logistic regression. Bear in mind that $f_j$ is not school $j$'s acceptance rate: it is the admissions probability specifically for this student. And we call the associated Bernoulli variable $Z_j$, which equals one if the student is admitted, and zero if not, to the school in question. We assume these are statistically independent. Now the student's principle decision is where to apply. We use $X$ to denote the set of schools that the student applies to, which we can call her application portfolio. The application portfolio is constrained by various costs associated with college application. We consider a single knapsack constraint, where $g_j$ is the cost of applying to school $j$, and $H$ is the total budget to spend on applications.

저희의 모형에서, $m$개의 대학교가 존재하는 대학 시장에서 단 한 명의 학생의 의사결정에 집중하기로 했습니다. 각 학교에 대해, 이 학생이 합격하는 확률 $f_j$가 주어집니다. 저희는 $f_j$를 외생변수로 모형화를 했지만, 실제 학생한테 이 문제를 적용하려면 수능 점수, 내신, 등의 학생 정보를 가지고 $f_j$를 추정할 수 있습니다. 중요한 것은, $f_j$는 학교 $j$의 합격률은 아닙니다. 이값은 바로 어떤 정해진 학생의 입학 확률을 의미합니다. 그에 해당하는 Bernoulli 확률 변수 $Z_j$는 그럼, 학생이 합격하면 1, 합격 못하면 0의 값을 가지게 되고, 모든  $Z_j$가 확률적으로 독립하다고 가정합니다. 그러면, 학생이 결정해야 하는 것은 바로 '어디'에 지원하는 것입니다. 학생이 지원하는 학교 집합, 즉 그의 '지원 포트폴리오'를 $X$라고 합니다. 지원 행동에 다양한 비용이 있기 때문에 모든 학교에 지원할 수 없고, 본 연구에서 배낭 제약식이 있는 상황을 고려합니다. 이때 $g_j$는 $j$번째 학교에 지원하는 비용을 의미하고, $H$는 지원에 지불할 수 있는 총 예산입니다.

Let's continue building our model by introducing a notion of utility. For each school, we have a nonnegative utility parameter $t_j$ which represents the utility that the student receives if she goes there, and we assume that the student gets $0$ utility if she gets in nowhere. Now, the utility that the student experiences from the college admissions process is whatever the $t_j$-value is for the school she actually attends, that is, the best school to which she both applies and is admitted. We refer to the expected maximum over the $t_j Z_j$s as the application portfolio's valuation, notated $v(X)$.

모형을 완성하기 위해 효용의 개념을 도입해 보겠습니다. 각 학교에 대해, $t_j$는 학생이 그 학교에 진학하면 발생하는 효용을 의미합니다. 어떤 대학에도 합격하지 않는 경우, $0$의 효용이 발생한다고 가정할 수 있습니다. 이제 전체 대학 입학 과정을 통해서 학생에게 발생하는 효용은, 그가 실제로 진학하는 학교, 즉 지원을 하고 합격을 하는 학교 중, 가장 좋은 학교에 해당하는 $t_j$값입니다. $t_j Z_j$의 기대 최댓값을 지원 포트폴리오의 '가치'라고 부르고 $v(X)$처럼 표기하겠습니다.

To put $v(X)$ into some sort of tractable form, we introduce the function $p_j(X)$, which gives the probability that the student actually enrolls $c_j$. This will happen only if she applies to $c_j$, gets into $c_j$, and does not get into any of the schools she likes better than $c_j$. Now the expression for $p_j(X)$ as is shown on the screen. By taking the inner product with $t$, we get the student's overall expected utility. It is this final function that we will seek to maximize.

그러면 $v(X)$를 계산할 수 있는 함수 형태로 나타내기 위해, $p_j(X)$라는 함수를 먼저 정의해봅시다. 이것은 학생이 실제로 학교 $j$에 진학할 확률을 의미하며, 그 조건은 $c_j$에 지원하고, $c_j$에서 합격하고, 또한 $c_j$보다 좋아하는 학교에서 모두 합격하지 않았을때입니다. 그러면 $p_j(X)$를 화면처럼 표현할 수 있습니다. 이때 $t$와의 내적은 계산하면 학생의 기대 효용이 나옵니다. 이 함수를 최대화하는 것은 대학 지원 최적화 문제입니다.

Here is a concise expression of the college application problem. We will work mainly with the first form, in which the decision variable is the set $X$. One can show that this objective function is nondecreasing and submodular. The college application problem can also be expressed as an integer optimization problem. We observe that the integer NLP form has a polynomial objective function of degree $m$. It is neither concave nor convex.

대학 지원 문제를 간단하게 정리하자면 화면과 같습니다. 저희는 주로 첫번째 모형을 다루겠습니다. 여기서 결정 변수는 집합 $X$가 되고, 이 목적함수가 단조 submodular 집합 함수인 것을 보일 수 있습니다. 그런데 대학 지원 최적화 문제는 정수 비선형 계획으로도 표현할 수 있습니다. 정수 NLP 형태는 $m$차 다항식의 목적함수를 가지고, 이것이 오목도 아니고 볼록도 아닌 것을 확인할 수 있습니다.

## The status quo
Let's consider the status quo in college application.

그러면, 이 문제의 현재 상황을 좀 정리해봅시다.

In Korea as well as in the US, there is a lucrative industry called "college admissions consulting," which involves estimating students' admissions probabilities, coaching them on standardized tests, helping them produce their application materials, and finally, deciding where to apply. If you read marketing materials from these companies, they often invoke the idea of safety schools, which are schools that have low utility but are relatively easy to get into, and reach schools, which are highly selective but highly desirable, and target schools, which are somewhere in between. A common belief is the idea that you should a roughly even mix of these three. This is a very legible heuristic, but is it accurate? What does the evidence show?

전세계적으로 소위 '입학 컨설팅'이라는 것은 수익성이 높은 산업입니다. 입학 컨설팅 회사에서, 학생의 합격 확률을 추정하고, 입시 코칭도 해주고, 원서를 작성하는 것을 도와주고, 마지막으로 어디에 지원할지 결정하는 데에 상담하고 있습니다. 입학 컨설팅 회사의 홍보 자료를 보시면 자주 나오는 말은, 효용은 낮은데 붙기가 쉬운 '안정 지원 학교', 혹은 붙기가 어려운데 효용이 높은 '상향 지원 학교', 그리고 그 사이에 있는 '소신 지원 학교'라는 세가지 범주로 학교들을 나눕니다. 이때 안정, 소신, 그리고 상향 지원학교이 대략 균일하게 지원하는 것이 좋다는 것을 일종의 통념입니다. 이것은 아주 이해하기 쉬운 휴리스틱이지만, 이것에 대한 근거같은 게 있을까요?

I'm now going to give you a chance to try making your own application strategy. This picture shows an arguably typical college market. We've plotted the admissions probability on the x-axis, and the utility on the y-axis. If, for example, a school were in the top right, then that would be a school that you can easily get into and that you really like—so you should obviously apply there. But in the typical scenario, schools like that don't exist. Instead, there is correlation between attractiveness and selectiveness. In this picture, then, we can identify schools on the top left as "reach schools," and those on the bottom right as "safety schools." Now, let's suppose that all the schools in this picture have the same application cost, so that we are working with essentially a constraint on the number of schools we can apply to. If you can only choose three schools, which three will you pick?

이제 지원 전략 짜는 것을 연습하시는 기회를 드리겠습니다. 이 그림에서 어떻게 보면 '전형적인' 대학 시장이 등장합니다. x측에는 어떤 학생의 합격확률이 있고, y측에는 효용이 있습니다. 그러면 만약에 어떤 학교가 오른쪽 위에 있다면, 그것은 쉽게 붙이는 학교이고, 또한 아주 좋아하는 학교가 되니까 당연히 지원을 하겠습니다. 그런데, 보통 같으면 그런 학교는 존재하지 않습니다. 대신 학교의 '매력'과 '경쟁성'이 그림처럼 비례합니다. 여기서 왼쪽 위에 있는 학교를 '상향' 지원 학교, 그리고 오른쪽 아래에 있는 학교를 '안정' 지원 학교로 볼 수 있습니다. 그러면, 편의상 이 그림에서 나타나는 모든 학교의 지원 비용이 동일하다고 가정합시다. 즉, 배낭 제약식 대신 지원할 수 있는 학교의 개수만 제한됩니다. 이 중에서 3개의 학교만 선택하신다면, 어디를 선택하시겠습니까?

Taking a look at the optimal solution, we can see first that the schools lie on a sort of efficient frontier. This makes sense: a school that's in the interior of the distribution is trivially dominated by schools to the upper right of it, which have both higher utility and better admissions odds. We also that three schools chosen are spread out, rather than close together. One could reasonably label them as reach, target, and safety schools. So perhaps the admissions consultants aren't entirely off base.

이 모형이 유도하는 실제 최적해를 보게 되면, 우선 지원하는 학교들은 어떤 효율적 투자성에 앉아 있는 것을 먼저 관찰할 수 있습니다. 이건 일리가 있는 결과이죠. 분포의 내부에 있는 학교는, 그의 오른쪽 위에 있는 학교는 효용도 높고 합격 확률도 높으니까 쉽게 우위를 합니다. 그리고, 선택된 3개의 학교는 같이 모여 있지 않고, 어느정도 펼쳐 있습니다. 상향, 소신, 안정 지원 학교로 라벨을 쉽게 붙일 수 있습니다. 그러면 입학 컨설턴트의 아이디어는 좀 유력해 보일 수 있습니다.

We can call this reach/safety school strategy a kind of "distributive heuristic." It tells you that the schools in your portfolio should vary in their risk characteristics. However, it doesn't specify exactly where the boundary is between a reach school and a target school and a safety school. Moreover, regardless of how you define a safety school, we argue in our paper that this distributive heuristic actually ends up being unnecessarily risk averse when the application budget is large. As an alternative, another heuristic we might propose is the "linearization heuristic." The idea here is, if you apply to just one school, then the expected utility is $f_j t_j$, so why not use that as the coefficient in a linear objective function and solve the corresponding knapsack problem? Nevermind that the knapsack problem is NP-complete, this solution can be an arbitrarily poor fit for the college application problem, as we show by pathological example. Finally, we mention that when a problem similar to arose in an equilibrium analysis of the American college market, the author resorted to enumeration. But we want to solve larger problems, so we derived algorithms that are both tractable in terms of computation time, and have guaranteed accuracy.

저희는 이런 상향, 소신, 안정 지원 전략을 '배분적 휴리스틱'이라고 부릅니다. 위험 성질이 다양한 학교들을 포트폴리오에 포함해야 한다고 의미합니다. 그런데 이 휴리스틱을 사용하면 상향, 소신, 안정 지원 학교 사이의 경계가 어디에 있는지가 정의되진 않습니다. 또한, 그 경계를 어떻게 정의한다고 해도, 지원할 수 있는 학교의 개수가 높을 때, 즉 지원 예산이 많을 때 배분적 휴리스틱이 과도하게 위험 회피적인 것을 보일 수 있습니다. 논문에서 '선형화 휴리스틱'이란 다른 휴리스틱을 의논합니다. 선형화 휴리스틱의 기본 생각은, 학교 하나만 지원하면, 그 기대 효용은 $f_j t_j$이라는 겁니다. 그러면 선형 목적 함수에 이를 각 학교의 가중치로 도입하고 해당 배낭 문제를 대리 문제 풀 수 있습니다. 배낭 문제 그자체가 NP-complete한 것은 물론이고, 사실 이런 휴리스틱을 대학 지원 문제에 적용하면 최적성 비율이 0에 무한히 가까운 예시를 만들 수 있습니다. 마지막으로, 미국 대학 시장의 균형 분석을 한 선행 연구 중에서, 저희 문제하고 비슷한 부문제가 등장한 사례가 있는데 그때 열거법으로 풀었다고 합니다. 저희는 큰 인스턴스를 풀고 싶기 때문에, 계산 시간 입장에서도 효율적이고, 또한 정확도가 보장된 알고리즘을 제시하는 게 본 연구의 목표였습니다.

## Our algorithms
For the remainder of the presentation, we will be taking a look at our solution algorithms.

남은 발표에서, 저희가 제시하는 해법을 설명하고자 하겠습니다.

First, let's focus on a special case that can be solved in polynomial time. This is the case we saw earlier, where instead of heterogeneous application costs, we have simply a cardinality constraint on the number of applications we can submit. This is similar to the Korean admissions process, in which there is not application fee, but you cannot apply to more than three schools in the main admissions cycle. We are able to show that the optimal portfolios in this case have a special structure: When the application limit increases from $h$ to $h+1$, the optimal application portfolio is formed by just adding one school to the one before it. We call this the "nestedness" property, and it implies that a greedy algorithm that adds schools one at a time is optimal. Through a variable-elimination technique, we reduce the computation of the objective function to amortized unit time, which brings the computation time down to a quadratic. Our Julia implementation of this algorithm is quite fast.

다항 시간에 풀 수 있는 특수한 경우를 먼저 보겠습니다. 이것은 아까 본 것처럼 배낭 제약식 대신 지원 포트폴리오의 크기만 제한되는 경우이며, 지원 비용은 없지만 정시 모집 기간에 학교 3개만 지원할 수 있는 한국 입학 과정과 비슷한 상황입니다. 이 케이스에서, 최적 포트폴리오가 특별한 구조를 가지는 것을 보일 수 있었습니다. 지원 제한이 $h$에서 $h+1$로 늘어날 때, 새로운 최적 포트폴리오는 그 전의 최적해의 확장 집합입니다. 이것은 포함 사슬 관계, 즉 nestedness 성질이라고 부르며, 목적 함수를 가장 많이 증가시키는 학교를 차례대로 포트폴리오에 추가하는 탐욕 해법이 정확하다는 것을 의미합니다. 목적 함수를 계산하는 시간은 원래 $O(m)$인데, 저희는 어떤 변수 소거법을 개발해서 환산 단위 시간으로 계산하고 최적해를 이차 시간에 구하는 해법을 제시할 수 있었습니다. 쥴리아 언어로 이 해법을 구현했을 때 실제 계산 속도도 빨랐습니다.

To get a feel for what this nestedness property really means, here is a small, fictional admissions market with 8 schools in it. We have each school's name, as well as the input data, namely $f_j$ and $t_j$. And the output of our algorithm is shown in the priority column. The nestedness property means that if the application limit $h$ is $3$, then we should apply to the schools with "priority" 1, 2, and 3: Jupiter University, Venus University, and Pluto College. I have also indicated the utility associated with each optimal portfolio. If we plot these valuations in ascending order, we get ...

포함 사슬 관계 성질의 유익성을 이해하기 위해 학교 여덟개로 이뤄진 가상 입학 시장을 고려합시다. 표에서 각 학교의 이름과 이 문제의 입력 데이터인 $f_j$와 $t_j$가 있습니다. 알고리즘의 출력도 '지원 순위' 열에 나와 있습니다. 포함 사슬 관계 성질에 따라, 지원 제한이 3일때, 지원 순위가 3 이라인 3개의 학교, 즉 목성대, 금성대, 그리고 명왕성대로 지원하는 것이 최적입니다. 마기막기 열에서, 각 $h$에 해당하는 포트폴리오 가치도 기록했습니다. 이 값들은 $h$ 순서대로 그래프를 그리면,

... this concave valuation curve. In this special case, we can prove that the valuation curve always exhibits diminishing returns to the application budget. This is a somewhat typical result in submodular maximization problems.

이러한 오목 곡선이 나옵니다. 지원 비용이 모두 동일한 이 특수한 경우에서, 이런 가치 곡선의 오목성, 즉 지원 예산에 대한 한계 효용 체감이 항상 성립하는 것을 증명할 수 있습니다. submodular 최대화 문제에서 자주 이러나느 현상입니다.

Now, let's look at the general problem. To reiterate, this problem is NP-complete, as we show by a reduction from the knapsack problem. But we offer four algorithms which come with various pros and cons. The first is a branch-and-bound scheme; while our implementation is not the most effective algorithm of the four, the linear relaxation we provide could be used as the basis for a more competitive algorithm. The second is a dynamic program that iterates on the total portfolio expenditures. This algorithm is exact, and runs in pseudopolynomial time in $m$ and $H$. Arguably, in typical college application instances, the application costs are small integers, and this algorithm is very fast in such a situation. Next, we use a different dynamic program based on rounding the portfolio valuations down to a fixed-point decimal to derive a fully polynomial time approximation scheme, or FPTAS. This is an important finding, because FPTAS's do not exist for general submodular maximization. Finally, for comparative purposes, we also outline a simulated annealing heuristic which offers no approximation guarantee but is very good in practice.

그 다음에 일반적인 문제로 넘어가겠습니다. 아까 말씀 드린 것처럼 이 문제는 배낭 문제의 일반화이므로 NP-complete한 문제입니다. 따라서 다양한 장단점이 있는 4가지 알고리즘을 제시합니다. 첫째는 branch and bound 알고리즘입니다. 4개 중에 이것의 효율성을 제일 낮은 해법이지만, 저희가 제시한 선형 완화 문제를 이용해서 이 알고리즘을 개선할 수 있는 방법이 많습니다. 둘째 알고리즘은 총 지원 지출액으로 탐색하는 동적 계획입니다. 정확한 해법이며, 그의 계산 시간은 $m$과 $H$의 다항 시간, 즉 의사 다항 시간을 넘지 않습니다. 실제 대학 지원 인스턴스에서는, 지원 비용이 작은 정수가 되는 경우가 많은데 그때 이 알고리즘은 매우 효율적입니다. 그다음에, 포트폴리오 가치를 고정소숫점으로 내림하는 또다른 동적 계획이 있습니다. 라운딩의 정확도를 조정하면 해법의 정확도를 원하는 만큼 늘릴 수 있으므로 이를 통해서 완전 다항 시간 근사 해법, 즉 FPTAS를 이뤄낼 수 있었습니다. 일반적인 submodular 최대화 문제에는 FPTAS가 존재하지 않으므로 이것은 어느 정도 의미가 있는 결과입니다. 마지막으로, 다른 알고리즘을 비교하는 목적으로 simulated annealing 기반 휴리스틱 알고리즘을 제시하며, 정확도는 보장되지 않지만 가상 인스턴스에 대한 성능이 좋았습니다.

## Conclusion
Let's move onto the conclusion.

결론입니다.

College application is an intruiguing optimization problem, with its unusual "maximax" form and integrality constraint. While on its surface, it looks like a submodular maximization problem, in terms of the solution techniques and approximation results we can derive, it behaves more like the knapsack problem. And the analogy with knapsack continues in the special case, where each $g_j = 1$ and the problem can be solved in polynomial time by a greedy algorithm. Next, we note that college application is a matter of practical importance and value. Right now, if you try to hire an America college consultant, they will charge an average of 200 dollars per hour. Obviously, they do more than just solve optimization problems, but the high cost of admissions consulting services was one motivation for us to open source our code and algorithms. Links to my GitHub and our arXiv paper are given on the following slide. Finally, in the paper we propose several extensions to the model which I would be happy to take questions about. Thank you.

목적함수의 maximax 형태 그리고 정수 조건 때문에 대학 지원 문제는 방법론적으로 흥미로운 최적화 문제라고 생각합니다. 표면에는 어려운 submodular 최적화 문제처럼 보이지만, 알고리즘의 구조와 근서 해법의 존재성을 보니까 그의 난이도는 배낭 문제에 더 가깝습니다. 모든 지원 비용이 동일한 특수한 경우도 탐용 해법으로 다항 시간에 풀 수 있다는 점도 배낭 문제와 유사합니다. 그다음에, 대학 지원이라는 것에는 실제적인 중요성과 가치 있다고 생각합니다. 지금, 미국 입시 컨설턴트에게 문의해보시면, 시간당 24만원의 급료를 청구할 수 있습니다. 물론, 입학 컨설턴트는 최적화 문제를 푸는 거 외에도 많은 서비스를 제공하지면, 입학 컨설팅의 높은 비용을 반영하여 이 연구를 하면서 개발한 코드를 open-source license로 공개하기로 했습니다. 다음 화면에서 GitHub 리포 그리고 저희 arXiv 논문 링크를 찾으실 수 있습니다. 마지막으로, 논문에서 이 모형에 대한 여라가지 확장을 제안하는데, 혹시 궁금하시면 질의시간에 더 설명드리고자 하겠습니다. 감사합니다.

<!-- ko: 16:58 -->
