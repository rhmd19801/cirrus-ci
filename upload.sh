if [ -f ~/rom/out/target/product/whyred/xdCLO*.zip ]; then
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Uploading Build $(cd ~/rom/out/target/product/whyred/ && ls xdCLO*.zip)"
      rclone copy ~/rom/out/target/product/whyred/xdCLO*.zip venyx:whyred -P
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Build $(cd ~/rom/out/target/product/whyred/ && ls xdCLO*.zip) Uploaded Successfully!"
fi

if [ -f ~/rom/out/target/product/whyred/obj/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb ]; then
      rclone copy ~/rom/out/target/product/whyred/obj/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb venyx:whyred -P
fi

if [ -f ~/rom/out/error.log ]; then
      LOG=~/rom/out/error.log
      curl -F document=@$LOG https://api.telegram.org/$tokentl/sendDocument?chat_id=$idtl \
      -F caption="Check these error logs"
fi
