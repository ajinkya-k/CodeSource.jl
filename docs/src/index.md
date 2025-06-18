# CodeSource

This package provides two macros: `@code_src` and `@code_simple`.
Both macros display the source code for the method that will be dispatched based on the evaluated types of the function arguments.
The only difference between the two is that `@code_src` output uses syntax highlighting while `@code_simple` output is plain text.

```@example Main
using CodeSource
@code_src sum(1:10)
```

```@example Main
@code_simple sum(1:10)
```
