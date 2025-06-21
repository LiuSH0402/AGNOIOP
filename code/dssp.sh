#!/bin/bash

# 指定 PDB 文件和输出 DSSP 文件的目录
PDB_DIR=""  # PDB 文件所在目录
OUTPUT_DIR=""  # 输出 DSSP 文件的目录

# 如果输出目录不存在，则创建该目录
mkdir -p $OUTPUT_DIR

# 遍历 PDB 目录中的所有 .pdb 文件
for pdb_file in $PDB_DIR/*.pdb; do
    # 提取文件名（不带路径和扩展名）
    base_name=$(basename "$pdb_file" .pdb)

    # 生成对应的 DSSP 文件名
    output_file="$OUTPUT_DIR/$base_name.dssp"

    # 运行 mkdssp 命令生成 DSSP 文件
    echo "Processing $pdb_file to generate $output_file"
    /home/shliu/mkdssp -i "$pdb_file" -o "$output_file"

    # 检查是否成功生成
    if [ $? -eq 0 ]; then
        echo "Successfully generated $output_file"
    else
        echo "Failed to generate DSSP for $pdb_file"
    fi
done