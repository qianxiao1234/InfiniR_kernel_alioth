# InfiniR Kernel for Redmi K40
- 使用 ReSukiSU 作为默认 KSU
- 无 KPM 支持
- 无 SUSFS 支持
- 仅支持 lz4
- 内核版本 4.19.322
## 使用方法：
```bash
./run.sh
```
## 更新KSU
```bash
curl -LSs "https://raw.githubusercontent.com/ReSukiSU/ReSukiSU/main/kernel/setup.sh" | bash -s builtin
```
