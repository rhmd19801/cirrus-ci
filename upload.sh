if [ -f ~/rom/out/target/product/dipper/qassa-*.zip ]; then
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Uploading Build $(cd ~/rom/out/target/product/dipper/ && ls qassa-*.zip)"
      rclone copy ~/rom/out/target/product/dipper/qassa-*.zip venyx:dipper -P
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Build $(cd ~/rom/out/target/product/dipper/ && ls qassa-*.zip) Uploaded Successfully!"
fi
