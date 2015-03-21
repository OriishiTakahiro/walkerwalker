#このリポジトリについて  

-----  

##リポジトリの中身  
- README.md  -> リポジトリについて  
- SensorMain -> センサーアプリ  
- walker_server -> サーバーアプリ  

-----  

##Apiのルーティング  

###センサアプリ向け  
- 歩数投稿  
 - URL : /walker/sensor/steps/post_step  
 - param : userhash, step  
 - response : ```{response,stock_step,total_step}```
- GPSクエスト報告  
 - URL : /walker/sensor/gpsquests/post_location  
 - param : userhash, latitude, longitude  
 - response : ```{response}```
- QRコード投稿  
 - URL : /walker/sensor/qrcodes/post_qrcode  
 - param : userhash, code  
 - response : ```{response}```

###ゲームアプリ向け  
- アイテムデータ取得  
 - URL : /walker/game/items/get_items_entity  
 - param : userhash  
 - response : ```{response,[id,name,effective_term,effective_value,description,amount]}```
- CP取得  
 - URL : /walker/game/steps/get_step  
 - param : userhash  
 - response : ```{response,step,total_step}```
