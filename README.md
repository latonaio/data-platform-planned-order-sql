# data-platform-planned-order-sql 
data-platform-planned-order-sql は、データ連携基盤において、計画手配データを保存するSQLテーブルを作成するためのレポジトリです。   

## 前提条件  
data-platform-planned-order-sql  は、データ連携にあたり、API を利用し、本レポジトリ の sql 設定ファイルの内容は、下記 URL の API 仕様を前提としています。  
https://api.XXXXXXXX.com/api/OP_API_XXXXXXX_XXX/overview 

## sqlの設定ファイル

data-platform-planned-order-sql には、sqlの設定ファイルとして、以下のファイルが含まれています。    

* data-platform-planned-order-sql-header-data.sql（データ連携基盤 計画手配 - ヘッダデータ）
* data-platform-planned-order-sql-header-doc-data.sql（データ連携基盤 計画手配 - ヘッダ文書データ）
* data-platform-planned-order-sql-item-data.sql（データ連携基盤 計画手配 - 明細データ）
* data-platform-planned-order-sql-item-doc-data.sql（データ連携基盤 計画手配 - 明細文書データ）
* data-platform-planned-order-sql-item-component-data.sql（データ連携基盤 計画手配 - 明細構成品目データ）
* data-platform-planned-order-sql-item-operation-data.sql（データ連携基盤 計画手配 - 明細作業データ）
* data-platform-planned-order-sql-item-operation-component-data.sql（データ連携基盤 計画手配 - 明細作業構成品目データ）

## MySQLのセットアップ / Kubernetesの設定 / SQLテーブルの作成方法

MySQLのセットアップ / Kubernetesの設定 / 具体的なSQLテーブルの作成方法、については、[mysql-kube](https://github.com/latonaio/mysql-kube)を参照ください。
