local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Define custom LaTeX snippets for Markdown files
ls.add_snippets("markdown", {
  -- Inline math: $ ... $
  s("imath", {
    t("$"), i(1, "equation"), t("$")
  }),

  -- Block math: $$ ... $$
  s("bmath", {
    t("$$"), t({"", ""}), i(1, "equation"), t({"", "$$"})
  }),

  -- LaTeX fraction: \frac{a}{b}
  s("frac", {
    t("\\frac{"), i(1, "numerator"), t("}{"), i(2, "denominator"), t("}")
  }),

  -- LaTeX sum: \sum_{i=0}^{n} expression
  s("sum", {
    t("\\sum_{"), i(1, "i=0"), t("}^{"), i(2, "n"), t("} "), i(3, "expression")
  }),

  -- LaTeX integral: \int_{a}^{b} expression
  s("int", {
    t("\\int_{"), i(1, "a"), t("}^{"), i(2, "b"), t("} "), i(3, "expression"), t(" \\, dx")
  }),

  -- LaTeX limit: \lim_{x \to a} expression
  s("lim", {
    t("\\lim_{"), i(1, "x \\to a"), t("} "), i(2, "expression")
  }),

  -- LaTeX product: \prod_{i=1}^{n} expression
  s("prod", {
    t("\\prod_{"), i(1, "i=1"), t("}^{"), i(2, "n"), t("} "), i(3, "expression")
  }),

  -- LaTeX matrix: \begin{matrix} ... \end{matrix}
  s("matrix", {
    t("\\begin{matrix}"),
    t({"", ""}), i(1, "a & b \\\\ c & d"), t({"", "\\end{matrix}"})
  }),

  -- LaTeX aligned equations: \begin{aligned} ... \end{aligned}
  s("align", {
    t("\\begin{aligned}"),
    t({"", ""}), i(1, "a &= b \\\\ c &= d"), t({"", "\\end{aligned}"})
  }),

  -- LaTeX square root: \sqrt{expression}
  s("sqrt", {
    t("\\sqrt{"), i(1, "expression"), t("}")
  }),

  -- LaTeX powers: x^n
  s("pow", {
    i(1, "x"), t("^"), t("{"), i(2, "n"), t("}")
  }),

  -- LaTeX subscript: x_n
  s("sub", {
    i(1, "x"), t("_"), t("{"), i(2, "n"), t("}")
  }),

  -- LaTeX greek letter: \alpha (add more as needed)
  s("alpha", { t("\\alpha") }),
  s("beta", { t("\\beta") }),
  s("gamma", { t("\\gamma") }),
  s("delta", { t("\\delta") }),
  s("epsilon", { t("\\epsilon") }),

  -- LaTeX binomial coefficient: \binom{n}{k}
  s("binom", {
    t("\\binom{"), i(1, "n"), t("}{"), i(2, "k"), t("}")
  }),

  -- LaTeX text inside math: \text{something}
  s("text", {
    t("\\text{"), i(1, "text"), t("}")
  }),

  -- LaTeX partial derivative: \frac{\partial f}{\partial x}
  s("partial", {
    t("\\frac{\\partial "), i(1, "f"), t("}{\\partial "), i(2, "x"), t("}")
  }),

  -- LaTeX differential: \frac{d}{dx} f
  s("diff", {
    t("\\frac{d}{d"), i(1, "x"), t("} "), i(2, "f")
  }),

  -- LaTeX vector: \vec{x}
  s("vec", {
    t("\\vec{"), i(1, "x"), t("}")
  }),

  -- LaTeX hat notation: \hat{x}
  s("hat", {
    t("\\hat{"), i(1, "x"), t("}")
  }),

  -- LaTeX inequality: a \leq b
  s("leq", {
    i(1, "a"), t(" \\leq "), i(2, "b")
  }),

  -- LaTeX inequality: a \geq b
  s("geq", {
    i(1, "a"), t(" \\geq "), i(2, "b")
  }),

  -- LaTeX absolute value: |x|
  s("abs", {
    t("\\left|"), i(1, "x"), t("\\right|")
  }),

  -- LaTeX norm: \|x\|
  s("norm", {
    t("\\left\\|"), i(1, "x"), t("\\right\\|")
  }),

  -- LaTeX set: \{a, b, c\}
  s("set", {
    t("\\left\\{"), i(1, "a, b, c"), t("\\right\\}")
  }),

  -- LaTeX floor function: \lfloor x \rfloor
  s("floor", {
    t("\\left\\lfloor "), i(1, "x"), t(" \\right\\rfloor")
  }),

  -- LaTeX ceiling function: \lceil x \rceil
  s("ceil", {
    t("\\left\\lceil "), i(1, "x"), t(" \\right\\rceil")
  }),

  -- LaTeX derivative: \frac{dy}{dx}
  s("deriv", {
    t("\\frac{d"), i(1, "y"), t("}{d"), i(2, "x"), t("}")
  }),

  -- LaTeX partial derivative: \frac{\partial y}{\partial x}
  s("pderiv", {
    t("\\frac{\\partial "), i(1, "y"), t("}{\\partial "), i(2, "x"), t("}")
  }),

  -- LaTeX double derivative: \frac{d^2y}{dx^2}
  s("dderiv", {
    t("\\frac{d^2"), i(1, "y"), t("}{d"), i(2, "x"), t("^2}")
  }),

  -- LaTeX vector bold: \mathbf{x}
  s("bvec", {
    t("\\mathbf{"), i(1, "x"), t("}")
  }),

  -- LaTeX span of a vector space: \text{span} \{v_1, v_2, ..., v_n\}
  s("span", {
    t("\\text{span} \\left\\{"), i(1, "v_1, v_2, ..., v_n"), t("\\right\\}")
  }),

  -- LaTeX trace of a matrix: \text{tr}(A)
  s("trace", {
    t("\\text{tr}("), i(1, "A"), t(")")
  }),

  -- LaTeX determinant of a matrix: \text{det}(A)
  s("det", {
    t("\\text{det}("), i(1, "A"), t(")")
  }),

  -- LaTeX transpose of a matrix: A^{T}
  s("transpose", {
    i(1, "A"), t("^{T}")
  }),

  -- LaTeX infinity symbol: \infty
  s("infty", {
    t("\\infty")
  }),

  -- LaTeX summation with conditions: \sum_{i=1}^{n} \text{condition}
  s("condsum", {
    t("\\sum_{"), i(1, "i=1"), t("}^{"), i(2, "n"), t("} "), i(3, "\\text{condition}")
  }),

  -- LaTeX logical and: \land
  s("land", {
    t("\\land")
  }),

  -- LaTeX logical or: \lor
  s("lor", {
    t("\\lor")
  }),

  -- LaTeX implies: \implies
  s("implies", {
    t("\\implies")
  }),

  -- LaTeX equivalent: \iff
  s("iff", {
    t("\\iff")
  }),

  -- LaTeX for all: \forall
  s("forall", {
    t("\\forall ")
  }),

  -- LaTeX exists: \exists
  s("exists", {
    t("\\exists ")
  }),

  -- LaTeX nabla: \nabla
  s("nabla", {
    t("\\nabla ")
  }),

  -- LaTeX Laplacian: \Delta
  s("laplacian", {
    t("\\Delta ")
  }),

  -- LaTeX gradient: \nabla \mathbf{f}
  s("grad", {
    t("\\nabla \\mathbf{"), i(1, "f"), t("}")
  }),

  -- LaTeX curl: \nabla \times \mathbf{F}
  s("curl", {
    t("\\nabla \\times \\mathbf{"), i(1, "F"), t("}")
  }),

  -- LaTeX divergence: \nabla \cdot \mathbf{F}
  s("div", {
    t("\\nabla \\cdot \\mathbf{"), i(1, "F"), t("}")
  }),

  -- LaTeX big O notation: O(n)
  s("bigO", {
    t("\\mathcal{O}("), i(1, "n"), t(")")
  }),

  -- LaTeX belongs to: \in
  s("in", {
    i(1, "x"), t(" \\in "), i(2, "\\mathbb{R}")
  }),

  -- LaTeX does not belong to: \notin
  s("notin", {
    i(1, "x"), t(" \\notin "), i(2, "\\mathbb{R}")
  }),

  -- LaTeX subset: A \subseteq B
  s("subset", {
    i(1, "A"), t(" \\subseteq "), i(2, "B")
  }),

  -- LaTeX union: A \cup B
  s("union", {
    i(1, "A"), t(" \\cup "), i(2, "B")
  }),

  -- LaTeX intersection: A \cap B
  s("intersect", {
    i(1, "A"), t(" \\cap "), i(2, "B")
  }),

  -- LaTeX set difference: A \setminus B
  s("setdiff", {
    i(1, "A"), t(" \\setminus "), i(2, "B")
  }),

  -- LaTeX empty set: \emptyset
  s("emptyset", {
    t("\\emptyset")
  }),

  -- LaTeX angle: \angle ABC
  s("angle", {
    t("\\angle "), i(1, "ABC")
  }),

  -- LaTeX perpendicular: A \perp B
  s("perp", {
    i(1, "A"), t(" \\perp "), i(2, "B")
  }),

  -- LaTeX parallel: A \parallel B
  s("parallel", {
    i(1, "A"), t(" \\parallel "), i(2, "B")
  }),
})

