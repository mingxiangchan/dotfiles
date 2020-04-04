# Syncing dotfiles

```bash
# copy existing system configs into source_files folder
bash sync.sh copy_from_existing

# symlink from souce_files folder into home folder
bash sync.sh symlink_source_files
```

# Installing Dev Tools and Utils

Install ansible and run the following command

```
ansible-playbook setup.yml -K
```
