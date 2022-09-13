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

ice_sheets_pages = ["Marine Ice Sheets" => "pages/marine_ice_sheets.md"
                    "Grounding Lines" => "pages/grounding_lines.md"]


ice_ocean_pages = ["Subglacial Plumes" => "pages/subglacial_plumes.md",
                    "Ice Ocean Boundary Layer" => "pages/ice_ocean_boundary_layer.md"]




pages = [
    "Home" => "index.md",
    "About" => "about.md",
    "Ice Sheets" => ice_sheets_pages,
    "Ice-Ocean" => ice_ocean_pages,
    "Submit A Schematics" => "submit.md",
    "References" => "references.md",
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




