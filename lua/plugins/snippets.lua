local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require "luasnip.extras"
local rep = extras.rep
local fmt = require "luasnip.extras.fmt".fmt
local fmta = require "luasnip.extras.fmt".fmta
local c = ls.choice_node


-- per informatzioni su come ho configurato il mio file video:
-- https://youtu.be/FmHhonPjvvA
-- oppure la pagina github:
-- https://github.com/L3MON4D3/LuaSnip/tree/master

--- SNIPPETS -------

ls.add_snippets("lua", {
    s("hello", {
        t('print("hello '),
        i(1),
        t(' world")')
    }),

    s("snipl", fmta(
    [=[
        s("<>", fmta(
        [[
        <>
        ]]
        )), { <> }
    ]=], { i(1), i(2), i(3) }
    )),

})

ls.add_snippets("tex", {
    s("beg", fmt(
    [[
    \begin{{{}}}
            {}
    \end{{{}}}
    ]], {
        i(1), i(0), rep(1)
    })),

    s("setup", fmt(
    [[
    \documentclass[oneside]{{book}} % remove 'oneside' if printing!
    \usepackage{{graphicx}} % Required for inserting images
    \usepackage[margin=3.5cm]{{geometry}}
    \usepackage{{parskip}}

    \usepackage[T1]{{fontenc}}
    \usepackage[utf8]{{inputenc}}
    \usepackage{{chemfig}}
    \usepackage{{tikz}}
    \usepackage{{amsmath}}

    % for numbered lists
    \usepackage{{enumerate}}

    % for figures
    \usepackage{{booktabs}}
    \usepackage{{rotating}}
    \usepackage{{float}}

    % for the table of contents
    \usepackage{{blindtext}}
    \usepackage{{titlesec}}

    \title{{{}}}
    \author{{Rodrigo Aldegheri}}
    \date{{{}}}

    %%%%%%%%%%%%%%%%%%%%%%%%DOCUMENT%%%%%%%%%%%%%%%%%%%%%%%%
    \begin{{document}}

    \maketitle

    \tableofcontents
    {}
    \end{{document}}
    ]], {
        i(1), i(2), i(3)
    })),

    s("eq", fmt(
    [[
    \begin{{equation}}
        {}
    \end{{equation}}
    ]], {
        i(1)
    })),

    s("eqa", fmta(
    [[
    \begin{equation}
        \begin{aligned}
            <>
        \end{aligned}
    \end{equation}
    ]], {
        i(1)
    })),

    s("frac", fmta(
    [[
    \frac{<>}{<>}
    ]], { i(1), i(2) }
    )),

    s("itmz", fmta(
    [[
    \begin{itemize}
    \item <>
    \end{itemize}
    ]], { i(1) }
    )),

    s("itm", {
        t("\\item ", i(1))
    }),

    s("enum", fmta(
    [[
    \begin{enumerate}[<>]
        <>
    \end{enumerate}
    ]], {
        c(1, {
            t("I"),
            t("i"),
            t("1"),
            t("a")
        }),
        i(2),
    })),

    s("sec", fmta(
    [[
    \<>section{<>}
    ]], {
        c(1, {
            t(""),
            t("sub"),
            t("subsub")
        }),
        i(2)
    })),

    s("chap", fmta(
    [[
    \chapter{<>}
    ]], { i(1) }
    )),

    s("tit", fmta([[\textit{<>}]], { i(1) })),
    s("tbf", fmta([[\textbf{<>}]], { i(1) })),
    s("tsc", fmta([[\textsc{<>}]], { i(1) })),
})

---- Keymaps ----
--- ANCORA IN FASE DI REVISIONE!!!!!

vim.keymap.set({"i"}, "<C-B>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-Q>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-D>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-L>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})


------ import ----

return{
	  "L3MON4D3/LuaSnip",
	  version = "v2.3.0",
    build = "make install_jsregexp",
}

