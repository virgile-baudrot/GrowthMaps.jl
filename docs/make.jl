using Documenter, GrowthMaps, Weave, IJulia

basedir = dirname(@__FILE__)

jmdpath = joinpath(basedir, "src/example.jmd")

# Generate examples markdown and images
mdpath = joinpath(basedir, "src/example.md")
weave(jmdpath, out_path=mdpath, doctype="github")

# Generate examples notebook
notebookdir = joinpath(basedir, "build/notebook")
notebookpath = joinpath(notebookdir, "example.ipynb")
mkpath(notebookdir)
convert_doc(jmdpath, notebookpath)

# Generate HTML docs
makedocs(
    modules = [GrowthMaps],
    sitename = "GrowthMaps.jl",
    pages = [
        "Home" => "index.md",
        "Examples" => "example.md",
    ],
    clean = false,
)

deploydocs(
    repo = "github.com/cesaraustralia/GrowthMaps.jl.git",
)

