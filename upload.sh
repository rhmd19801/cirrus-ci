if [ -f ~/rom/out/target/product/ysl/Kasumi*ysl*.zip ]; then
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Uploading Build $(cd ~/rom/out/target/product/ysl/ && ls Kasumi*.zip)"
      rclone copy ~/rom/out/target/product/ysl/Kasumi*ysl*.zip venyx:ysl -P
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Build $(cd ~/rom/out/target/product/ysl/ && ls Kasumi*.zip) Uploaded Successfully!"
fi

if [ -f ~/rom/out/target/product/ysl/obj/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb ]; then
      rclone copy ~/rom/out/target/product/ysl/obj/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb venyx:ysl -P
fi

if [ -f ~/rom/out/error.log ]; then
      LOG=~/rom/out/error.log
      curl -F document=@$LOG https://api.telegram.org/$tokentl/sendDocument?chat_id=$idtl \
      -F caption="Check these error logs"
fi
