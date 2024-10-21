local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
	s("#base", {
		t({
			"#include <iostream>",
			"#include <string>",
			"#include <vector>",
			"#include <math.h>",
			"#include <algorithm>",
			" ",
			"using namespace std;",
			" ",
			"int main() {",
			" ",
			"  ",
		}),
		i(1, "Bade bhari coder ho riya hai ... complex use karega !!!"),
		t({ " ", " ", "  return 0;", "}" }),
	}),
	s("bro", {
		t({
			"#include <iostream>",
			" ",
			"using namespace std;",
			" ",
			"int main() {",
			" ",
			"  ",
		}),
		i(1, "le re lund ke ..."),
		t({ " ", " ", "  return 0;", "}" }),
	}),
})
