using Test, OhMyREPL, CodeTracking, CodeSource

@testset "code_src macro" begin
    original_stdout = stdout

    (rd, wr) = redirect_stdout()

    @code_src sum(1:3)
    redirect_stdout(original_stdout)
    close(wr)

    s = read(rd, String)
    redirect_stdout(original_stdout)
    @test occursin("\e[", s)
    @test occursin("AbstractRange", s)
end
