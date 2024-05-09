import pexpect
import os
import sys
import time
import argparse


parser = argparse.ArgumentParser(description="Process device type.")
parser.add_argument('--type', type=str, help='The type of the device')
args = parser.parse_args()

device_type = args.type

current_path = os.getcwd()
tunnel_file = 'code'

command_path = os.path.join(current_path, tunnel_file)
cli_dir = os.path.join(current_path, device_type)
# Launch the vscode tunnel process
child = pexpect.spawn(f'{command_path} tunnel --accept-server-license-terms --name {device_type} --cli-data-dir {cli_dir}', encoding='utf-8', codec_errors='ignore')
child.logfile = sys.stdout  # direct the command output to std output 

try:
    # Match the `How would you like to log in to Visual Studio Code` 
    child.expect('How would you like to log in to Visual Studio Code', timeout=30)
    # Press the downward arrow and Enter button to select login with Github Account
    child.sendline('\033[B\r')
    # Monitoring the 
    while True:
        try:
            child.expect('.+', timeout=60)  # match any output
        except pexpect.TIMEOUT:
            time.sleep(600)
            print("No Output detected. Continue Waiting.")
        except pexpect.EOF:
            print("Finish")
            break 
except pexpect.EOF:
    print("Finish")
except pexpect.TIMEOUT:
    child.expect('Open this link in your browser')
    print('Existing Session Detected.')
    while True:
        try:
            child.expect('.+', timeout=60)  # match any output
        except pexpect.TIMEOUT:
            time.sleep(60)
            print("No Output detected. Continue Waiting.")
        except pexpect.EOF:
            print("Finish")
            break  
