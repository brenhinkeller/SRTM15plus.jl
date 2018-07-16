# Establish data path
datapath = joinpath(Pkg.dir("SRTM15plus"),"data")
filepath = joinpath(datapath, "SRTM15plus.nc")

# Download NetCDF file from Google Cloud if necessary
if ~isfile(filepath) || ~stat(filepath).size==2783012160
    print("Downloading SRTM15plus.nc from google cloud storage\n")
    mkpath(datapath) # Ensure directory exists
    download("https://storage.googleapis.com/statgeochem/SRTM15plus.nc", filepath)
end

function loadSRTM15plus()
    # Read NetCDF file
    print("Reading from NetCDF:\n")
    @time elevation = ncread(filepath, "z")
    return elevation
end
export loadSRTM15plus