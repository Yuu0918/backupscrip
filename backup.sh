#!/bin/bash
#
#マイクラのバックアップスクリプト

#######メッセージ送信#######
time1=30
screen -S minecraft -X stuff 'say §a§l§n自動アナウンス'`echo -ne '\015'`
screen -S minecraft -X stuff 'say §b'$time1'§r秒後に§lバックアップ§6を行います。'`echo -ne '\015'`
time2=`expr $time1 - 10`
sleep `expr $time2`
screen -S minecraft -X stuff 'say §cまもなくバックアップを行います。'`echo -ne '\015'`
sleep 10

############## バックアップ開始 #################
#ワールドディレクトリのコピー
cp -r "directory" "directory"/backup

#zip圧縮
cd "directory"/backup && zip -r -m world.`date "+%Y%m%d_%H%M"`.zip "directory"/backup/world

#古いファイルを削除
cd "directory"/backup && rm -f `ls -t . | tail -n+11`

#######メッセージ送信#######
screen -S minecraft -X stuff 'say §a§l管理者向け'`echo -ne '\015'`
screen -S minecraft -X stuff 'say バックアップ完了。'`echo -ne '\015'`
