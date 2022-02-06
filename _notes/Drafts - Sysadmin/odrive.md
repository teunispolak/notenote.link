#### odrive ####
odrive has two main functions: sync and backup. Backup is still in beta.

The sync function does exactly what the name suggests: it keeps storage on the local disk in sync with storage in the cloud. 


#### odrive folder ####
The odrive folder (~/odrive) is a copy of the remote storage folder tree: the root of the remote tree (/Amazon Drive for example) is mapped on to ~/odrive


#### Sync
This creates a link between the folder in odrive and a folder in the cloud


#### Unsync 
Once a folder or a file is in sync, odrive can replace the local copy with a link, thus freeing up disk space.


#### Refresh
Updates the sync status of a file or folder directly rather than waiting for a regulare background check


#### Sync to odrive
Creates a link between a local folder and a folder under ~/odrive. This folder shows up in the app menu under sync to odrive as Open folder.

What I do not understand is that the sync status of the local folder and its counterpart under ~/odrive are not necessarily equal. Refresh doesn't do the trick either.

When you remove the sync between the local folder and the folder under ~/odrive, any placeholders are lost. To avoid this, first sync the entire folder, then remove the sync. 