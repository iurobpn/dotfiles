cat stow-dirs.txt | awk ' BEGIN { FS=": " } { print $2 }' | awk 'BEGIN {FS=" => "} { print "$HOME/"$1 }' > stow-files.txt
cat stow-files.txt | xargs -n1 unlink
