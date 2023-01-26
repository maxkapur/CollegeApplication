# CollegeApplication

Working repo for my MS thesis, “The College Application Problem,” at Seoul National University. You can download the PDF (`thesis/paper-en.pdf` or `thesis/paper-ko.pdf`) in your preferred language, or clone the repo and run `make` to build from the LaTeX source.

If you found this research useful, please consider citing either [our arXiv paper](https://arxiv.org/abs/2205.01869) or this thesis:

- Kapur, Max. 2022. “The College Application Problem.” MS thesis, Seoul National University. <https://github.com/maxkapur/CollegeApplication>.

I’d prefer that you use this GitHub repo as the URL (so that I can fix typos 🤣), but if your style guide requires an “official” link, you can use <http://www.dcollection.net/handler/snu/000000172202>, which comes from the SNU thesis archive. The Korean text there matches the `v0.1.0` release tagged here.

## Table of contents

| Directory | Contents | Formats | English | Korean | Coauthors |
|-----------|----------|---------|---------|--------|-----------|
| `paper_alma/`   |  A concise paper on the cardinality-constrained college admissions problem (Alma’s problem), focusing on the greedy algorithm and student welfare analysis. | PDF, LaTeX | ✓ | | Yim Seho, Sung-Pil Hong | 
| `paper_ellis/`  |  A concise paper on the knapsack-constrained college admissions problem (Ellis’s problem), focusing on its computational complexity and exact and approximate algorithms. | PDF, LaTeX | ✓ | ||
| `poster/`       |  A one-sheet summary of the research prepared for JuliaCon 2022, with an emphasis on the `OptimalApplication.jl` package. | PDF, ODT | ✓ | ||
| `slides_03min/` |  Slides and script for the JuliaCon 2022 presentation. [Click here](https://maxkapur.com/CollegeApplication/) to view them in your browser. | HTML | ✓ | ||
| `slides_08min/` |  Slides and script for a presentation at the department’s research fair. | PDF, LaTeX | ✓ | ✓ ||
| `slides_15min/` |  Slides and script for a presentation at the spring 2022 conference of the Korean industrial engineering society (대한산업공학회). | PDF, LaTeX | ✓ | ✓ ||
| `slides_25min/` |  Slides and script for my defense presentation. | PDF, LaTeX | ✓ | ✓ ||
| `thesis/`       |  My MS thesis. The contents are essentially the same as the arXiv paper, but updates appear here first. | PDF, LaTeX | ✓ | ✓ ||

For the associated Julia package, which implements the algorithms provided in paper, see https://github.com/maxkapur/OptimalApplication.

Comments and suggestions are welcome via email ([maxkapur@gmail.com](mailto:maxkapur@gmail.com)) or GitHub pull request.
