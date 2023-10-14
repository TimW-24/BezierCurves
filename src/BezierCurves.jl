module BezierCurves
#=
Timothy Ward - egytw1@nottingham.ac.uk

Bezier Curve Implementation
Beats Bezier.jl in speed & allocations

Required Packages: none
=#
export bezier
"""
    bezier(xcoords,ycoords,points::Int64)
Converts control point coordinates and curve fidelity request to appropriate bezier curve. Defaults to 101 curve points.\n
    OUTPUTS: (bezierX::Array{Float64},bezierY::Array{Float64})
"""
function bezier(xcoords,ycoords,points::Int64=100)
    if length(xcoords) != length(ycoords)
        throw(ArgumentError("X-coords array and Y-coords array must be the same length!"))
    end #Throws error if coords have been entered badly
    dt = 1/(points-1) #Defines gap between values of t
    range = 0:dt:1 #Defines range of bezier curve points
    n = lastindex(xcoords)-1 #No. of control points (0-indexed)
    bezierX = Array{Float64,1}(undef,length(range))
    bezierY = Array{Float64,1}(undef,length(range)) #Defines bezier curve points arrays
    for (ind,t) ∈ enumerate(range)
        (sumX,sumY) = (0,0) #Initiates sums
        for i ∈ eachindex(xcoords)
            bern = bernstein(t,i-1,n) #Calculates bezier polynomial for each value of t and i
            sumX = sumX + bern*xcoords[i]
            sumY = sumY + bern*ycoords[i] #Sums the results over every value of i
        end
        bezierX[ind] = sumX
        bezierY[ind] = sumY #Defines bezier curve co-ordinate for every t
    end
    return (bezierX,bezierY)
end
"""
    bernstein(t,i,n)
Calculates the Bernstein Polynomial of the given inputs.\n
    OUTPUT: bern::Float64
"""
function bernstein(t,i,n)
    fact = factorial(n)/(factorial(i)*factorial(n-i))
    return fact*(t^i)*((1-t)^(n-i))
end
end #Module: BezierCurves