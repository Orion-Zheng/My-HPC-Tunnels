# 1. Installation
First, you need to create a project in Google Cloud and create a Storage Bucket in the console.
```
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-468.0.0-linux-x86_64.tar.gz
tar -xf google-cloud-cli-468.0.0-linux-x86_64.tar.gz

./google-cloud-sdk/install.sh
./google-cloud-sdk/install.sh --help

# https://cloud.google.com/sdk/docs/initializing
./google-cloud-sdk/bin/gcloud init
# This step set up Account, specify google project
```

# 2. Upload and Download
There are a few important points to note:
- Although both upload and download speeds are fast, uploading and storage are cheap, while the traffic cost for downloading is expensive. Therefore, please be sure to avoid full downloads.
- Data migration across regions also incurs high costs, so please use with caution.
- `gsutils` is deprecated, `gcloud` will automatically enable multiprocessing.
## 2.1 Upload Examples
```
gcloud storage cp -r ./experiment_* gs://tacc-backup
```
## 2.2 Download Examples
```
gcloud storage cp -r gs://tacc-backup/tokenized_datasets ./
gcloud storage cp -r gs://tacc-backup/experiment_models/tinyllama_expanded_empty ./models/
```