if [ -f ~/rom/out/target/product/juice/qassa-*.zip ]; then
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Uploading Build $(cd ~/rom/out/target/product/juice/ && ls qassa-*.zip)"
      rclone copy ~/rom/out/target/product/juice/qassa-*.zip venyx:juice -P
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Build $(cd ~/rom/out/target/product/juice/ && ls qassa-*.zip) Uploaded Successfully!"
fi
