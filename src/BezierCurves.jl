module BezierCurves
#= 
Author: Timothy Ward, https://github.com/TimW-24
Dependencies: Julia Base v1.9
Bezier Curve Implementation
=#
export bezier

"""
    bezier(xcoords::Array{<:Number},ycoords::Array{<:Number},points::Int64)
Converts control point coordinates to appropriate bezier curve with specified number of points. Defaults to 100 curve points.\n
    OUTPUTS: (bezierX::Array{Float64},bezierY::Array{Float64})
"""
function bezier(xcoords::Array{<:Number},ycoords::Array{<:Number},points::Int64=100)
    if length(xcoords) != length(ycoords)
        throw(ArgumentError("X-coords array and Y-coords array must be the same length!"))
    end #Throws error if coords have been improperly defined
    range = 0:1/(points-1):1 #Defines range of bezier curve points, from points argument
    n = lastindex(xcoords)-1 #No. of control points (0-indexed)
    (bezierX,bezierY) = (Array{Float64,1}(undef,length(range)),Array{Float64,1}(undef,length(range))) #Defines bezier curve points arrays
    for (ind,t) ∈ enumerate(range)
        (sumX,sumY) = (0,0) #Initiates sums
        for i ∈ eachindex(xcoords)
            bern = bernstein(t,i-1,n) #Calculates bezier polynomial for each value of t and i
            sumX = sumX + bern*xcoords[i]
            sumY = sumY + bern*ycoords[i] #Sums the results over every value of i
        end
        (bezierX[ind],bezierY[ind]) = (sumX,sumY) #Defines bezier curve co-ordinates for every t
    end
    return (bezierX,bezierY)
end

"""
    bernstein(t,i,n)
Calculates the Bernstein Polynomial of the given inputs.\n
    OUTPUT: bern::Float64
"""
bernstein(t,i,n) = (factorial(n)/(factorial(i)*factorial(n-i)))*(t^i)*((1-t)^(n-i))
end #Module: BezierCurves