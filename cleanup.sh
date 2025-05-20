#!/bin/bash

# Đường dẫn đến thư mục upload
UPLOAD_DIR="uploads"

# Kiểm tra xem thư mục upload có tồn tại không
if [ -d "$UPLOAD_DIR" ]; then
  # Kiểm tra xem file done.flag có tồn tại trong thư mục upload không
  if [ -f "$UPLOAD_DIR/done.flag" ]; then
    echo "done.flag is detected, start to delete done.flag and firmware.bin"
    rm -f "$UPLOAD_DIR/done.flag"
    rm -f "$UPLOAD_DIR/firmware.bin"
    echo "done.flag and firmware.bin are deleted successfully"
  else
    echo "Can not find done.flag in upload folder"
  fi
else
  echo "upload folder does not exist"
fi