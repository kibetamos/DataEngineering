import os
import requests
import gzip
import shutil
import pandas as pd

# Define the base URL for downloading files
BASE_URL = "https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/"

# Define the months to download (January to July 2021)
MONTHS = [f"2021-{str(m).zfill(2)}" for m in range(1, 8)]

# Create a directory to store data
DATA_DIR = "green_taxi_data_2021"
os.makedirs(DATA_DIR, exist_ok=True)

def download_file(month):
    """Downloads and extracts a gzip CSV file."""
    file_name = f"green_tripdata_{month}.csv.gz"
    url = BASE_URL + file_name
    local_gz_path = os.path.join(DATA_DIR, file_name)
    local_csv_path = local_gz_path.replace(".gz", "")
    
    # Download the file
    print(f"Downloading {file_name}...")
    response = requests.get(url, stream=True)
    if response.status_code == 200:
        with open(local_gz_path, "wb") as f:
            shutil.copyfileobj(response.raw, f)
        print(f"Downloaded {file_name}")
    else:
        print(f"Failed to download {file_name}")
        return None
    
    # Extract the file
    print(f"Extracting {file_name}...")
    with gzip.open(local_gz_path, "rb") as f_in, open(local_csv_path, "wb") as f_out:
        shutil.copyfileobj(f_in, f_out)
    os.remove(local_gz_path)  # Remove the .gz file to save space
    print(f"Extracted {local_csv_path}")
    
    return local_csv_path

# Download and extract all files
csv_files = [download_file(month) for month in MONTHS]

# Verify the downloaded files
print("\nDownloaded files:")
for file in csv_files:
    if file:
        print(file)
