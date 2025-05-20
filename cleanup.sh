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

    # Commit thay đổi xóa file
    git add "$UPLOAD_DIR/done.flag" "$UPLOAD_DIR/firmware.bin"
    git commit -m "Xóa done.flag và firmware.bin"
    git push origin master
    echo "Đã commit và push thay đổi xóa file"

    # Làm mới cache CDN bằng cách thêm và xóa file giả
    echo "Bắt đầu làm mới cache CDN..."
    echo "test" > "$UPLOAD_DIR/dummy.txt"
    git add "$UPLOAD_DIR/dummy.txt"
    git commit -m "Thêm file giả để làm mới cache CDN"
    git push origin master
    echo "Đã thêm file giả dummy.txt"

    rm -f "$UPLOAD_DIR/dummy.txt"
    git add "$UPLOAD_DIR/dummy.txt"
    git commit -m "Xóa file giả để làm mới cache CDN"
    git push origin master
    echo "Đã xóa file giả dummy.txt"
    echo "Hoàn tất làm mới cache CDN"
  else
    echo "Can not find done.flag in upload folder"
  fi
else
  echo "upload folder does not exist"
fi