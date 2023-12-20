# "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"で自動実行する必要あり
wsl bash -c "echo stop | nc -u localhost 10000 & sleep 5; exit;"


# これで行けるような気がする。分からんけど。
# まあWSL使うよりPythonやCでnc実装したほうが良いんじゃねって気はする。
