#このリポジトリについて  
=====
##リポジトリの中身  
---
*README.md  
    リポジトリについて  
*SensorMain  
    センサーアプリ  
*walker_server
    サーバーアプリ  
=====
##Apiのルーティング  
---
###センサアプリ向け  
*歩数投稿  
    */walker/sensor/steps/post_step      
    *userhash, step  
*GPSクエスト報告  
    */walker/sensor/gpsquests/post_location  
    *userhash, latitude, longitude  
*QRコード投稿  
    */walker/sensor/qrcodes/post_qrcode
    *userhash, code
###ゲームアプリ向け  
*アイテムデータ取得  
    */walker/game/items/get_items_entity  
    *userhash
*CP取得
    */walker/game/steps/get_step
    *userhash
