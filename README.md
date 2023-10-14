# BezierCurves
Author: Timothy Ward, https://github.com/TimW-24

Dependencies: Julia Base v1.9


Julia package that implements a bezier curve generation function, "bezier".

Uses less allocations & is faster than the registered "Bezier.jl" package.


Function can accept any number of control points, and defaults to 100 bezier curve co-ordinates.

Function is used as follows:


INPUTS: bezier(xcoords::Array{<:Number},ycoords::Array{<:Number},points::Int64=100)

Converts control point coordinates to appropriate bezier curve with specified number of points. Defaults to 100 curve points.

OUTPUTS: (bezierX::Array{Float64},bezierY::Array{Float64})