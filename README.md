# InfiniR Kernel For Redmi K40
- 使用 ReSukiSU 作为默认KSU
- 内核版本：4.19.322
- 无 kpm/susfs 支持（懒得搞）
- zram只支持lz4（原仓库就是这样，懒得加）
## 使用方法：
```bash
./run.sh
```
## 如需更新 KSU 请执行：
```bash
curl -LSs "https://raw.githubusercontent.com/ReSukiSU/ReSukiSU/main/kernel/setup.sh" | bash -s builtin
```
