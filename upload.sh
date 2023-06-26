if [ -f ~/rom/out/target/product/lime/lineage-18.1*zip ]; then
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Uploading Build $(cd ~/rom/out/target/product/lime/ && ls lineage-18.1*.zip)"
      rclone copy ~/rom/out/target/product/lime/lineage-18.1*zip venyx:lime -P
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Build $(cd ~/rom/out/target/product/lime/ && ls lineage-18.1*.zip) Uploaded Successfully!"
fi

if [ -f ~/rom/out/error.log ]; then
      LOG=~/rom/out/error.log
      curl -F document=@$LOG https://api.telegram.org/$tokentl/sendDocument?chat_id=$idtl \
      -F caption="Check these error logs"
fi
