
"""
Create a shared library from a C code string and return the path to the library.
"""
function _c2lib(libname::String, c_code::String)::String
    libpath = joinpath(dirname(@__FILE__), "lib$libname" * "." * Libdl.dlext)
    open(`gcc -fPIC -xc -shared -o $libpath -`, "w") do f
        write(f, c_code)
    end
    return libpath
end