using Documenter
using DocumenterVitepress
using CodeSource

makedocs(;
    # modules = [CodeSource],
    # repo = Remotes.GitHub("ajinkya-k", "CodeSource.jl"),
    # authors = "Jerry Ling <proton@jling.dev>, Ajinkya <ajinkyakokandakar@gmail.com> and contributors",
    # sitename = "CodeSource.jl",
    format = DocumenterVitepress.MarkdownVitepress(
        repo = "https://github.com/ajinka-k/CodeSource.jl",
    ),
    pages = [
        "index.md"
    ],
    clean = true
)

DocumenterVitepress.deploydocs(;
    repo = "github.com/ajinkya-k/CodeSource.jl", # this must be the full URL!
    devbranch = "main",
    push_preview = true,
)
