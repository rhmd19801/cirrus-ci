if [ -f ~/rom/out/target/product/juice/xdCAF*.zip ]; then
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Uploading Build $(cd ~/rom/out/target/product/juice/ && ls xdCAF*.zip)"
      rclone copy ~/rom/out/target/product/juice/xdCAF*.zip venyx:juice -P
      curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Build $(cd ~/rom/out/target/product/juice/ && ls xdCAF*.zip) Uploaded Successfully!"
fi

if [ -f ~/rom/out/target/product/juice/error.log ]; then
    sudo apt update && sudo apt install curl -y
    curl -F document=@~/rom/out/target/product/juice/error.log https://api.telegram.org/bot$tokentl/sendDocument \
        -F chat_id=$idtl \
        -F "disable_web_page_preview=true" \
        -F "parse_mode=html" \
        -F caption="Check these logs"
fi
