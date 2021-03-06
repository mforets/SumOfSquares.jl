__precompile__()

module SumOfSquares

export SOSModel

using LinearAlgebra

using MultivariatePolynomials
const MP = MultivariatePolynomials
using SemialgebraicSets
export @set
using MultivariateMoments

include("matpoly.jl")
include("sosdec.jl")

include("certificate.jl")

using JuMP
using PolyJuMP
export Poly

include("variable.jl")
include("constraint.jl")

function setdefaults!(data::PolyJuMP.Data)
    PolyJuMP.setdefault!(data, PolyJuMP.NonNegPoly, SOSCone)
    PolyJuMP.setdefault!(data, PolyJuMP.NonNegPolyMatrix, SOSMatrixCone)
end

function SOSModel(args...; kwargs...)
    model = Model(args...; kwargs...)
    setpolymodule!(model, SumOfSquares)
    model
end

end # module
