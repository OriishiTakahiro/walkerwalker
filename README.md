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
 - response : '''{respose,stock_step,total_step}'''
- GPSクエスト報告  
 - URL : /walker/sensor/gpsquests/post_location  
 - param : userhash, latitude, longitude  
 - response : '''{respose}'''
- QRコード投稿  
 - URL : /walker/sensor/qrcodes/post_qrcode  
 - param : userhash, code  
 - response : '''{respose}'''

###ゲームアプリ向け  
- アイテムデータ取得  
 - URL : /walker/game/items/get_items_entity  
 - param : userhash  
 - response : '''{respose,[id,name,effective_term,effective_value,description,amount]}'''
- CP取得  
 - URL : /walker/game/steps/get_step  
 - param : userhash  
 - response : '''{respose,step,total_step}'''
