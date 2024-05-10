# 1. Install `rclone`
```
wget https://github.com/rclone/rclone/releases/download/v1.66.0/rclone-v1.66.0-linux-amd64.zip
unzip rclone-v1.66.0-linux-amd64.zip
rm rclone-v1.66.0-linux-amd64.zip

cd rclone-v1.66.0-linux-amd64
chmod +X rclone

# use pwd to get the absolute dir path storing the executable rclone and add it to the $PATH
# pwd
# vim 
rclone --version
```

# 2. Configure the `rclone`
## 2.1 Set up OAuth on Google Cloud
Follow the document: https://rclone.org/drive/#making-your-own-client-id
## 2.2 Set up connection to your Google Drive
```
rclone config
# ----------- Configuration Begin -----------
# No remotes found, make a new one? 
# n/s/q> n
# Enter name for new remote. 
# name> my_gdrive

# Type of storage to configure.
# Storage> [ENTER THE NUMBER OF `Google Drive` OPTION IN YOUR RECLONE VERSION]

# Option client_id.
# NOTES: Find CLIENT_ID and CLIENT_SECRET from Google Cloud Console -> APIs & Service -> Credentials -> OAuth 2.0 Client IDs, which is set up in `Step 1`.
# client_id> YOUR_CLIENT_ID
Option client_secret.
# client_secret> YOUR_CLIENT_SECRET

# Option scope.
scope> 1 (FULL ACCESS)
# Option service_account_file.
service_account_file> (PRESS ENTER TO LEAVE EMPTY)
# Edit advanced config?
y/n> (PRESS ENTER TO LEAVE EMPTY)
# Use web browser to automatically authenticate rclone with remote?
# y/n> n
# Run the `rclone authorize ...` command from the output on your local machine, and authorize the access to your google drive in your browser, finally paste the `config_token` to your remote machine.
# config_token> YOUR_CONFIG_TOKEN_AFTER_AUTHORIZATION
# Configure this as a Shared Drive (Team Drive)?
y/n> (PRESS ENTER TO LEAVE EMPTY)
# Keep this "my_gdrive" remote?
# y/e/d> y

# ALL DONE! CAN QUIT.
# ----------- Configuration End -----------
```
## 2.3 Test the connection
```
rclone listremotes  # list all remote connections
rclone lsd my_gdrive:  # list directories in your remote drive, here we take `my_gdrive` as an example
```
# 3. Use `rclone` to Backup Files
## Option 1: Mount Google Drive on your local machine
`rclone mount` will run in a blocking mode, use `Ctrl+C` to unmount. If you want it to run continuously, consider running it in the background (by adding an '&' at the end), using tmux, or making it automatically mount on startup.
```
mkdir -p ~/gdrive_backup  # create a local dir to mount the google drive
rclone mount my_gdrive: ~/gdrive_backup # mount google drive to local dir
```
## Option 2: Upload Files Manually
You can use either `rclone copy` or `rclone sync` commands to upload files manually. Here we take `rclone copy` as an example. Compare to `rclone copy`, `rclone sync` may also delete some files in the remote drive, so please use with caution.

```
rclone copy -P  ./experiment_ckpts my_gdrive:research_backup
```

# Reference
1. https://ucr-research-computing.github.io/Knowledge_Base/how_to_mount_google_drive.html
2. https://ostechnix.com/mount-google-drive-using-rclone-in-linux/

