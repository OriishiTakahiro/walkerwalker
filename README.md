#このリポジトリについて  

-----  

###リポジトリの中身  
- README.md  -> リポジトリについて  
- SensorMain -> センサーアプリ  
- walker_server -> サーバーアプリ  

-----  
テスト用userhash : brj31inwqezl4ukg87vxd2h5o  
-----

###Apiのルーティング  

####センサアプリ向け  
- 歩数投稿  
 - URL : /walker/sensor/steps/post_step  
 - param : userhash, step  
 - response : ```{result,stock_step,total_step}```
- GPSクエスト報告  
 - URL : /walker/sensor/gpsquests/post_location  
 - param : userhash, latitude, longitude  
 - response : ```{result}```
- QRコード投稿  
 - URL : /walker/sensor/qrcodes/post_qrcode  
 - param : userhash, code  
 - response : ```{result}```

####ゲームアプリ向け  
- アイテムデータ取得  
 - URL : /walker/game/items/get_items_entity  
 - param : userhash  
 - response : ```{result,[id,name,effective_term,effective_value,description,amount]}```
- CP取得  
 - URL : /walker/game/steps/get_step  
 - param : userhash  
 - response : ```{result,step,total_step}```
- CP保存
	- URL : /walker/game/steps/post_step
	- param : userhash,step
	- response : ```{result,stock_step}```
- アイテム保有情報保存
 - URL : /walker/game/items/post_items  
 - param : ```[{id:amount},{id:amount}...]```
 - response : result
