
### Recipe 1: Filling a reference to a C variable

using Libdl

include("common.jl")


const libname = "ref-fill"
libpath = ""

function main()

    c_code = """
    void foo(int* a) {
        *a = 1;
    }
    """

    # Write the C code to a file and return the path to the library 
    # (can't be a local variable)
    global libpath = _c2lib(libname, c_code)

    aRef = Ref{Cint}(0)
    ccall((:foo, libpath), Cvoid, (Ptr{Cint},), aRef)
    a = aRef[]
    println(a)

end


main()
