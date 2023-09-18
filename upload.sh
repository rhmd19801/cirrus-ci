if [ -f ~/rom/out/target/product/citrus/qassa*.zip ]; then
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Uploading Build $(cd ~/rom/out/target/product/citrus/ && ls qassa*.zip)"
      rclone copy ~/rom/out/target/product/citrus/qassa*.zip venyx:citrus -P
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Build $(cd ~/rom/out/target/product/citrus/ && ls qassa*.zip) Uploaded Successfully!"
fi

if [ -f ~/rom/out/target/product/citrus/obj/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb ]; then
      rclone copy ~/rom/out/target/product/citrus/obj/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb venyx:citrus -P
fi
