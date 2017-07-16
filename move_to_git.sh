#all variables
deploy_dir="../thexavier666.github.io/"
html_dir="./public/"
all_files="*"
git_file="do_git.sh"

# Building site
hugo
echo "Site built"

# Removing previous files in deployment folder
echo "Removing previous files"
rm -rf $deploy_dir$all_files
#read -n 1 -s

# Moving new files to deployment folder
echo "Moving new files to deployment folder"
cp -r $html_dir$all_files $deploy_dir
#read -n 1 -s

# Copying the gitting file to deployment folder
# Since it was deleted last time
echo "Copying the file to deployment folder"
cp $git_file $deploy_dir
#read -n 1 -s

# Creating new shell | changing to deployment folder | gitting
echo "Creating new shell | changing to deployment dir | gitting"
(cd $deploy_dir && exec sh $git_file)

# gitting the MD files
# sh $git_file
