if [ -f ~/rom/out/target/product/juice/xdCAF*.zip ]; then
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Uploading Build $(cd ~/rom/out/target/product/juice/ && ls xdCAF*.zip)"
      rclone copy ~/rom/out/target/product/juice/xdCAF*.zip venyx:juice -P
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Build $(cd ~/rom/out/target/product/juice/ && ls xdCAF*.zip) Uploaded Successfully!"
fi
