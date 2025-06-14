module CodeSource

using InteractiveUtils
using Crayons
using JuliaSyntax
using CodeTracking
using OhMyREPL

export @code_src
export @code_simple

macro code_src(expr...)
    codestr = InteractiveUtils.gen_call_with_extracted_types_and_kwargs(CodeTracking, :code_string, expr)
    quote
        tokens = collect(JuliaSyntax.tokenize($codestr))
        crayons = fill(Crayon(), length(tokens))
        OhMyREPL.Passes.SyntaxHighlighter.SYNTAX_HIGHLIGHTER_SETTINGS(crayons, tokens, 0, $codestr)
        OhMyREPL.untokenize_with_ANSI(crayons, tokens, $codestr)
    end
end

macro code_simple(expr...)
    codestr = InteractiveUtils.gen_call_with_extracted_types_and_kwargs(__module__, :code_string, expr)
    :(print($codestr))
end
end
