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

ls.add_snippets("c", {

    s("init", fmta(
    [[
    #include <<stdio.h>>
    #include <<string.h>>

    int main(void){
        <>

        return 0;
    }
    ]], { i(1) }
    ))

})

ls.add_snippets("lua", {
    s("hello", {
        t('print("hello '),
        i(1),
        t(' world")')
    }),

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

    s("center", fmta(
    [[
    \begin{center} <> \end{center}
    ]], { i(1) }
    )),


    s("swi", fmta(
    [[
    \switchcolumn
        {\footnotesize <>}
    \switchcolumn
    ]], { i(1) }
    )),

    s("abbreviazioni", fmta(
    [[
    \chapter*{Abbreviazioni}
        \section*{Nomi}
            \begin{tabular}{ll}
                \textsc{<>} & <>\\
            \end{tabular}
    ]], { i(1), i(2) }
    )),

    s("quote", fmta(
    [[
    \begin{quote}
        \textit{``<>''}\\
        {\scriptsize <>}
    \end{quote}
    ]], { i(1), i(2) }
    )),

    s("quoteted", fmta(
    [[
    \begin{quote}
        \textit{``<>''}\\
        {\scriptsize Carla Tedeschi, \textit{<> lezione di filosofia}}
    \end{quote}
    ]], { i(1), i(2) }
    )),

    s("quoteman", fmta(
    [[
    \begin{quote}
        {\small ``<>''}

        {\scriptsize Alessandro Manzoni, \textit{I promessi sposi}, <>, p<>}
    \end{quote}
    ]], { i(1), i(2), i(3) }
    )),

    s("tabular", fmta(
    [[
    \begin{tabular}{ll}
        \textsc{<>} & <>\\
    \end{tabular}
    ]], { i(1), i(2) }
    )),

    s("abr", fmta(
    [[\textsc{<>} & <>\\]], { i(1), i(2) }
    )),

    s("data", fmta(
    [[
    \phantomsection % insert an anchor point
    \addcontentsline{toc}{section}{\textsc{\textbf{Lezione del<>}}}
    \section{<>}

    \begin{center} \textsc{Lezione del<>} \end{center}
    ]], { i(1), i(2), rep(1) }
    )),

    s("datan", fmta(
    [[
    \phantomsection % insert an anchor point
    \addcontentsline{toc}{section}{\textsc{\textbf{Nota del<>}}}
    \section{<>}

    \begin{center} \textsc{Nota del<>} \end{center}
    ]], { i(1), i(2), rep(1) }
    )),

    s("dataa", fmta(
    [[
    \phantomsection % insert an anchor point
    \addcontentsline{toc}{section}{\textsc{\textbf{Appunti del<>}}}
    \section{<>}

    \begin{center} \textsc{Appunti del<>} \end{center}
    ]], { i(1), i(2), rep(1) }
    )),

    s("img", fmta(
    [[
    \begin{figure}[H]
    \centering
    \includegraphics[width=1\textwidth]{<>}
    \caption{<>}
    \label{<>}
    \end{figure}
    ]], { i(1), i(2), i(3) }
    )),

    s("secpersformat", fmta(
    [[

    % --- SOLO i CAPITOLI in NUMERI ROMANI ---
    \renewcommand{\thechapter}{\Roman{chapter}}

    % ---- CHAPTER ----
    \titleformat{\chapter}
      {\centering\bfseries\scshape\Huge}
      {\thechapter}
      {1em}
      {}

     % ---- SECTION ----
    \titleformat{\section}
      {\centering\bfseries\scshape\Large} % Usa la dimensione originale di \section (Large)
      {\thesection}                       % Mostra numero della sezione
      {1em}
      {}

    % ---- SUBSECTION ----
    \titleformat{\subsection}
      {\centering\bfseries\scshape\normalsize} % Normalsize è la dimensione standard delle subsection
      {\thesubsection}
      {1em}
      {}

    % ---- SUBSUBSECTION ----
    \titleformat{\subsubsection}
      {\centering\bfseries\scshape\normalsize}
      {\thesubsubsection}
      {1em}
      {}

    ]], {}
    )),


    s("setup", fmt(
    [[
    \documentclass[oneside]{{book}} % remove 'oneside' if printing!
    \usepackage{{graphicx}} % Required for inserting images
    \usepackage[margin=3.25cm]{{geometry}}
    \usepackage{{parskip}}

    % font (garamond) UNCOMMENT TO DISPLAY GARAMOND
    %\usepackage[oldstyle]{{CormorantGaramond}}
    %\usepackage[cmintegrals,cmbraces]{{newtxmath}}
    \usepackage[T1]{{fontenc}}
    \usepackage[utf8]{{inputenc}}

    % robe di chimica
    \usepackage{{chemfig}}
    \usepackage{{tikz}}

    %math shit
    \usepackage{{amsmath}}

    % for numbered lists
    \usepackage{{enumerate}}

    %for languages
    \usepackage{{verse}}
    \usepackage[hidelinks]{{hyperref}}

    % for figures
    \usepackage{{booktabs}}
    \usepackage{{rotating}}
    \usepackage{{float}}

    % for the table of contents
    \usepackage{{blindtext}}
    \usepackage{{titlesec}}

    %bibliography
    \usepackage[backend=biber, style=numeric, sorting=nty]{{biblatex}}
    \addbibresource{{{}.bib}}

    \title{{{}}}
    \author{{Rodrigo Aldegheri}}
    \date{{{}}}

    %%%%%%%%%%%%%%%%%%%%%%%%DOCUMENT%%%%%%%%%%%%%%%%%%%%%%%%
    \begin{{document}}
    \maketitle
    \tableofcontents

    {}

    %%%%%%%%%%%%%%%%%%%%%%%%PROSSIMA LEZIONE%%%%%%%%%%%%%%%%%%%%%%%%


    % UNCOMMENT AFTER SETTING UP BIBLIOGRAPHY
    %\printbibliography


    \end{{document}}
    ]], {
        i(1), i(2), i(3), i(4)
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

    s("verse", fmta(
    [[
    \poemtitle{<>}
    \settowidth{\versewidth}{<>}
    \begin{verse}[\versewidth]
        <>
        <>
    \end{verse}
    ]], { i(1), i(2), rep(2), i(0)}
    )),

    s("chap", fmta([[\chapter{<>}]], { i(1) })),
    s("sec", fmta([[\section{<>}]], { i(1) })),
    s("ssec", fmta([[\subsection{<>}]], { i(1) })),
    s("sssec", fmta([[\subsubsection{<>}]], { i(1) })),

    s("footnote", fmta([[\footnote{<>}]], { i(1) })),
    s("tit", fmta([[\textit{<>}]], { i(1) })),
    s("tbf", fmta([[\textbf{<>}]], { i(1) })),
    s("tsc", fmta([[\textsc{<>}]], { i(1) })),
    s("ttt", fmta([[\texttt{<>}]], { i(1) }))
})

ls.add_snippets("cpp", {

    s("init", fmta(
    [[
    #include <<stdio.h>>
    #include <<string.h>>

    int main(void){
        <>

    return 0;
    }
    ]], { i(1) }
    ))
})

vim.keymap.set({ "i" }, "<C-B>", function() ls.expand() end, {silent = true})
vim.keymap.set({ "i", "s" }, "<C-Q>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({ "i", "s" }, "<C-D>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({ "i", "s" }, "<C-L>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})


------ package import ----

return{
	  "L3MON4D3/LuaSnip",
	  version = "v2.3.0",
    build = "make install_jsregexp",
}

