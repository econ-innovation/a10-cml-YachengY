
root_dir="assignment_cml"

files=(pubnr_cn.txt)

file_count=0
dir_count=0

for file in "${files[@]}"; do
    if [ ! -f "$file" ]; then
        echo "file not exist"
        continue
    fi
    
    if [ $((file_count % 100)) -eq 0 ]; then
        ((dir_count++))
        mkdir -p "$root_dir/$dir_count" || { echo "Failed"; exit 1; }
    fi
    
    mv "$file" "$root_dir/$dir_count/" || { echo "Failed"; exit 1; }
    
    ((file_count++))
done
