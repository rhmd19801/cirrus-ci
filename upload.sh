if [ -f ~/rom/out/target/product/ysl/evolution_ysl*.zip ]; then
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Uploading Build $(cd ~/rom/out/target/product/ysl/ && ls evolution_ysl*.zip)"
      rclone copy ~/rom/out/target/product/ysl/evolution_ysl*.zip venyx:ysl -P
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Build $(cd ~/rom/out/target/product/ysl/ && ls evolution_ysl*.zip) Uploaded Successfully!"
fi

if [ -f ~/rom/out/target/product/ysl/obj/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb ]; then
      rclone copy ~/rom/out/target/product/ysl/obj/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb venyx:ysl -P
fi
