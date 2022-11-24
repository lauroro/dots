#!/usr/bin/python

import subprocess
import os
import socket

icons = ["","","","","","","","","",""]

def update_workspace(active_workspace):
    icons_index = [0,1,2,3,4] 
    
    icons_index[active_workspace - 1] = icons_index[active_workspace - 1] + 5
    prompt = f"(box (label :text \"{icons[icons_index[0]]}  {icons[icons_index[1]]}  {icons[icons_index[2]]}  {icons[icons_index[3]]}  {icons[icons_index[4]]}\" ))"
    
    subprocess.run(f"echo '{prompt}'", 
                   shell=True)

sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)

server_address = f'/tmp/hypr/{os.environ["HYPRLAND_INSTANCE_SIGNATURE"]}/.socket2.sock'

sock.connect(server_address)

while True:
    new_event = sock.recv(4096).decode("utf-8")
    
    for item in new_event.split("\n"):
            
        if "workspace>>" == item[0:11]:
            workspaces_num = item[-1]
            
            if int(workspaces_num) > 5:
                workspaces_num = 1
                subprocess.run("hyprctl dispatch workspace 1", shell=True)

            update_workspace(int(workspaces_num))
