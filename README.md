# IBM Cloud Object Storage Archived Objects Restorer

This is a python script that automates the restoration of all archived objects in an IBM Object Storage instance bucket, depending on it\'s last modified date. The script named "restore_script.py" is the main script, and it should be run with no command line arguments. The script has one limitation. It only restores objects in the same bucket. As a workarround, you can run the script multiple times for diferent buckets

## What \"restore_script.py\" does

- ### Reads a \"values.env\" file, provided by you and in the same diretory, to get the following values

  - API_KEY: Your IBM Cloud API Key
  - COS_ENDPOINT: The endpoint for your COS instance can be found in the configuration tab.
  - BUCKET_NAME: The name of the bucket from which to restore the objects
  - DATE: Archived objects last modified after the specified date are the ones that will be restored
  - DAYS: How many days should the object be restored for
  - TIER: This value must match the archive class of the objects in the bucket. Either \"Bulk\" for normal archive, or \"Accelerated\" for accelerated archive

- ### Uses the provided API Key to retreive an oauth token

- ### Retrieves a list of all the objects in the bucket

- ### Selects the desired objects to restore

- ### Lastly, it restores those objects

### You can also get a good view of what the script does, by checking the \"example.logs\" file provided in this repository

## How to use

- Edit the \"example.env\" file, replacing the example values with your own.
- Rename the file to \"values.env\".
- Run the following instructions:

## Running as a container

Note: This container uses a bind mount to the script's directory, in order to save the \"logs\" file. Check your OS's and Docker's permissions regarding bind mounts in case of errors

### Using docker compose

```bash
docker-compose up
```

### Using docker run

```bash
docker build -t <image_name>:<tag> .
docker run -d --rm --name <container_name> --env-file=values.env -v ./:/icos-object-restorer <image_name>:<tag>
```

### Running localy

- Install dependencies

```bash
python -m pip install -r requirements.txt
```

- Run

```bash
python restore_script.py
```
