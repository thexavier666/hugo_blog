deploy_dir="../thexavier666.github.io/"
hugo_dir="./public/"
all_files="*"
git_file='do_git.sh'

# Removing previous files
rm -rf $deploy_dir$all_files

read -n 1 -s

# Moving new files to deployment folder
cp -r $hugo_dirs$all_files $deploy_dir

read -n 1 -s

# Adding permission to git script
chmod +x $git_file

read -n 1 -s

# Copying the file to deployment folder
cp $git_file $deploy_dir

read -n 1 -s

# Creating new shell | changing to deployment dir | gitting
(cd $deploy_dir && exec sh $git_file)
