push!(LOAD_PATH,"../src/")
import Pkg; Pkg.add("Documenter")
import Pkg; Pkg.add("DocumenterCitations")
import Pkg; Pkg.add("Literate")

using Documenter
using DocumenterCitations
using Literate 
using CryosphereSchematics

bib_filepath = joinpath(dirname(@__FILE__), "cryosphere_schematics.bib")
bib = CitationBibliography(bib_filepath)

ENV["GKSwstype"] = "100"

#####
##### Run julia code
#####

#const EXAMPLES_DIR = joinpath(@__DIR__, "..", "examples")
#const OUT_DIR   = joinpath(@__DIR__, "src","generated")

#examples = [
#    "example_one.jl"
#    "example_two.jl"
#    "example_three.jl"
#]

#for example in examples
#    filepath = joinpath(EXAMPLES_DIR, example)
#    Literate.markdown(example_filepath, OUT_DIR; flavor = Literate.DocumenterFlavor())
#end


#####
#### Organize page hierarchies
#####

#example_pages = [
#    "Example 1"    => "generated/example_one.md",
#    "Example 2"    => "generated/example_two.md",
#    "Example 3"    => "generated/example_three.md",
#]

ice_sheets_pages = ["Ice Sheets" => "pages/ice_sheets/ice_sheets.md"]
ocean_pages = ["Oceans" => "pages/ocean/oceans.md"]
ice_shelves_pages = ["Ice Shelves" => "pages/ice_shelves/ice_shelves.md"]
solid_precipitation_pages = ["Solid Precipitation" => "pages/solid_precipitation/solid_precipitation.md"]
lake_and_river_ice_pages = ["Lake and River Ice" => "pages/lake_and_river_ice/lake_and_river_ice.md"]
permafrost_pages =  ["Permafrost" => "pages/permafrost/permafrost.md"]
glacier_pages =  ["Permafrost" => "pages/glaciers/glaciers.md"]


pages = [
    "Home" => "index.md",
    "Ice Sheets" => ice_sheets_pages,
    "Oceans" => ocean_pages,
    "Ice Shelves" => ice_shelves_pages,
    "Solid Precipitation" => solid_precipitation_pages,
    "Lake and River Ice" => lake_and_river_ice_pages,
    "Permafrost" => permafrost_pages,
    "Glaciers" => glacier_pages,
    "Usage" => "usage.md"
    "Submit A Schematics" => "submit.md",
    "References" => "references.md"
]


#####
##### Build and deploy docs
#####

format = Documenter.HTML(
    collapselevel = 1,
       prettyurls = get(ENV, "CI", nothing) == "true",
        #canonical = "website_url_here",
       mathengine = MathJax3()
)


makedocs(bib,
  sitename = "Cryosphere Schematics",
   authors = "Alexander Bradley",
    format = format,
     pages = pages,
   modules = [CryosphereSchematics],
   doctest = false,
    strict = false,
     clean = false,
 checkdocs = :none # Should fix our docstring so we can use checkdocs=:exports with strict=true.
)
#makedocs(sitename="My Documentation")

deploydocs(;
    repo="github.com/alextbradley/CryosphereSchematics.jl",
    devbranch="main",
    versions = nothing
)




