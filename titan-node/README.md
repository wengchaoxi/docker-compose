# Titan Miner

生成 5 节点的 `docker-compose.yml`（一个 IP 最多只能运行 5 个节点）

```python
python generate.py 5
```

运行

```
sudo docker compose up -d
```

绑定身份码

```
sudo ./bind.sh <your-id>
```

设置存储大小

```
sudo ./storage.sh <storage-size>
```
