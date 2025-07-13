using Documenter
using DocumenterVitepress
using CodeSource

DocMeta.setdocmeta!(CodeSource, :DocTestSetup, :(using CodeSource); recursive=true)


makedocs(;
    modules = [CodeSource],
    repo = Remotes.GitHub("ajinkya-k", "CodeSource.jl"),
    authors = "Jerry Ling <proton@jling.dev>, Ajinkya <ajinkyakokandakar@gmail.com> and contributors",
    sitename = "CodeSource.jl",
    format = DocumenterVitepress.MarkdownVitepress(;
        repo = "https://github.com/ajinkya-k/CodeSource.jl",
    ),
    pages = [
        "Home" => "index.md"
    ],
    clean = true,
)

DocumenterVitepress.deploydocs(;
    repo = "github.com/ajinkya-k/CodeSource.jl",
    target = "build", # this is where Vitepress stores its output
    devbranch = "main",
    devurl = "dev",
    branch = "gh-pages",
    push_preview = true,
)
