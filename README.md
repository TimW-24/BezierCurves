# BezierCurves
Author: Timothy Ward, https://github.com/TimW-24\n
Dependencies: Julia Base v1.9\n\n

Julia package that implements a bezier curve generation function, "bezier".\n
It uses less allocations & is faster than the registered "Bezier.jl" package.\n\n

The function can accept any number of control points, and defaults to 100 bezier curve co-ordinates.\n
It is used as follows:\n\n

INPUTS: bezier(xcoords::Array{<:Number},ycoords::Array{<:Number},points::Int64=100)\n
OUTPUTS: (bezierX::Array{Float64},bezierY::Array{Float64})