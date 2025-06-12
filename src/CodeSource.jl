module CodeSource

using InteractiveUtils
using Crayons
using JuliaSyntax
using CodeTracking
using OhMyREPL

export @code_src

macro code_src(expr...)
    codestr = InteractiveUtils.gen_call_with_extracted_types_and_kwargs(CodeTracking, :code_string, expr)
    quote
        tokens = collect(JuliaSyntax.tokenize($codestr))
        crayons = fill(Crayon(), length(tokens))
        OhMyREPL.Passes.SyntaxHighlighter.SYNTAX_HIGHLIGHTER_SETTINGS(crayons, tokens, 0, $codestr)
        OhMyREPL.untokenize_with_ANSI(crayons, tokens, $codestr)
    end
end
end
