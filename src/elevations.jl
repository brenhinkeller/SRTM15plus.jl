# Download NetCDF file from Google Cloud if necessary
if ~isfile("data/SRTM15plus.nc") || ~stat("data/SRTM15plus.nc").size==2783012160
    print("Downloading SRTM15plus.nc from google cloud storage\n")
    mkpath("data") # Ensure directory exists
    download("https://storage.googleapis.com/statgeochem/SRTM15plus.nc","data/SRTM15plus.nc")
end

function loadSRTM15plus()
    # Read NetCDF file
    print("Reading from NetCDF:\n")
    @time elevation = ncread("data/SRTM15plus.nc", "z")
    return elevation
end
export loadSRTM15plus