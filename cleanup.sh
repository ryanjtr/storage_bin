#!/bin/bash

# # # Đường dẫn đến thư mục upload
UPLOAD_DIR="uploads"

# # # Kiểm tra xem thư mục upload có tồn tại không
# # if [ -d "$UPLOAD_DIR" ]; then
# #   # Kiểm tra xem file done.flag có tồn tại trong thư mục upload không
# #   if [ -f "$UPLOAD_DIR/done.flag" ]; then
# #     echo "done.flag is detected, start to delete done.flag and firmware.bin"
# #     rm -f "$UPLOAD_DIR/done.flag"
# #     rm -f "$UPLOAD_DIR/firmware.bin"
# #     echo "done.flag and firmware.bin are deleted successfully"
# #   else
# #     echo "Can not find done.flag in upload folder"
# #   fi
# # else
# #   echo "upload folder does not exist"
# # fi
# #!/bin/bash

# # Đường dẫn đến thư mục upload
# UPLOAD_DIR="uploads"

# # Kiểm tra và tạo thư mục uploads nếu chưa tồn tại
# if [  -d "$UPLOAD_DIR" ]; then

#   # Kiểm tra và xóa file done.flag và firmware.bin
#   if [ -f "$UPLOAD_DIR/done.flag" ]; then
#     echo "Phát hiện file done.flag hoặc firmware.bin, bắt đầu xóa..."
#     rm -f "$UPLOAD_DIR/done.flag" "$UPLOAD_DIR/firmware.bin"
#     echo "Đã xóa done.flag và firmware.bin"

#     # Commit và push thay đổi xóa file
#     git add "$UPLOAD_DIR/done.flag" "$UPLOAD_DIR/firmware.bin"
#     git commit -m "Xóa done.flag và firmware.bin" || echo "Không có thay đổi để commit"
#     git push origin master || { echo "Push xóa file thất bại"; exit 1; }
#   else
#     echo "Không tìm thấy done.flag hoặc firmware.bin trong thư mục $UPLOAD_DIR"
#   fi
# fi
# Kiểm tra và tạo thư mục uploads nếu chưa tồn tại
if [ -d "$UPLOAD_DIR" ]; then

  # Kiểm tra và xóa file done.flag và các file *.bin
  if [ -f "$UPLOAD_DIR/done.flag" ]; then
    echo "Phát hiện file done.flag hoặc các file *.bin, bắt đầu xóa..."
    rm -f "$UPLOAD_DIR/done.flag" "$UPLOAD_DIR"/*.bin
    echo "Đã xóa done.flag và các file *.bin"

    # Commit và push thay đổi xóa file
    git add "$UPLOAD_DIR/done.flag" "$UPLOAD_DIR"/*.bin
    git commit -m "Xóa done.flag và các file *.bin" || echo "Không có thay đổi để commit"
    git push origin master || { echo "Push xóa file thất bại"; exit 1; }
  else
    echo "Không tìm thấy done.flag hoặc các file *.bin trong thư mục $UPLOAD_DIR"
  fi
fi