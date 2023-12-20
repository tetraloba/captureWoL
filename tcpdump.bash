# sudo 必須
ssh_port=22 # ssh接続に使うポート(キャプチャ対象から除外)
stop_port=10000 # stop信号を受け取るポート
while true; do
    echo "capturing..."
    nohup tcpdump -nn -w /tmp/tcpdump/out.pcap -C 16 -W 3 not port $ssh_port &
    # 16MB 3ファイルのローテーション
    # $ssh_port 以外
    # `-s 512` パケットの戦闘から 512 B のみをキャプチャ
    echo $! > /tmp/tcpdump/pid; # tcpdumpのpidを記録
    nc -ul -W 1 $stop_port; # $stop_port でパケットを受けるまで待機
    kill -INT `cat /tmp/tcpdump/pid`; # tcpdumpを停止
    echo "done. at `date`"
    read -p "Enter to continue > " __ # Enterキーが入力されるまで停止
done;

