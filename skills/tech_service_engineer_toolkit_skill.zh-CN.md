# 技术服务工程师 Toolkit Skill

## 适用场景

当任务涉及技术支持、现场支持、Linux/网络排障、部署支持、支持交接、问题闭环，或基于本仓库做面试展示时，使用这个 skill。

## 使用前先读

1. `README.zh-CN.md`：了解仓库定位和导航。
2. `docs/toolkit_usage_guide.md`：了解整套工具怎么用。
3. `docs/troubleshooting_flow.md`：了解核心排障流程。
4. `ATTRIBUTION.md`：当任务涉及来源、借鉴、第三方边界时阅读。

## 场景选择

| 场景 | 看哪些 docs | 用哪些模板 | 用哪些脚本 |
| --- | --- | --- | --- |
| 未知故障 | `docs/troubleshooting_flow.md` | `templates/incident_report_template.md` | `scripts/system_health_check.sh` |
| 网络问题 | `docs/network_basics.md`, `docs/linux_quick_reference.md` | `templates/incident_report_template.md` | `scripts/network_basic_check.sh <target>` |
| 部署支持 | `docs/deployment_checklist.md` | `templates/deployment_record_template.md` | 部署前后运行 `scripts/system_health_check.sh` |
| 升级交接 | `docs/toolkit_usage_guide.md` | 故障或现场模板 | `scripts/collect_logs.sh` |
| 问题闭环 | `docs/troubleshooting_flow.md` | `templates/issue_closure_template.md` | 需要时补充证据脚本 |
| 面试展示 | `docs/service_engineer_interview_mapping.md` | `examples/` | `scripts/verify_toolkit.sh` |

## 最小可执行流程

1. 用一句话写清楚现象和影响。
2. 打开匹配模板，先开始记录。
3. 先跑只读检查：

```bash
./scripts/system_health_check.sh
./scripts/network_basic_check.sh <target>
```

4. 如果需要升级或离线分析，收集支持包：

```bash
./scripts/collect_logs.sh
```

5. 每条证据都写成：事实、解释、下一步。
6. 闭环时必须写验证方式、Owner、剩余风险和经验沉淀。

## 常见误区

- 没写原始现象就开始跑命令。
- 支持包没脱敏就外发。
- 把 `ping` 不通直接等同于业务服务挂了。
- 没有客户或干系人确认就关闭问题。
- 把模板当表格任务，而不是当排障决策工具。

## 推荐输出格式

```text
状态：
影响：
证据：
当前判断：
下一步：
Owner：
风险：
可复用经验：
```
