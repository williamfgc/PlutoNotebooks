
### Recipe 1: Filling a struct with data
### From https://stackoverflow.com/questions/64971847/how-to-access-c-struct-attributes-from-a-julia-ptr

using Libdl

include("common.jl")

struct Example
    a::Cint
    b::Cint
end

const libname = "struct-fill"
libpath = ""

function main()

    c_code = """
    typedef struct ex {
        int a;
        int b;
    } example;

    example foo() {
        example ex;
        ex.a = 1;
        ex.b = 2;
        return ex;
    }
    """

    # Write the C code to a file and return the path to the library 
    # (can't be a local variable)
    global libpath = _c2lib(libname, c_code)

    s = ccall((:foo, libpath), Example, ())
    println(s)

end


main()
