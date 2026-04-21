# 面试展示 Skill

## 目标

把本仓库讲成一个和技术服务工程师岗位强相关的项目，而不是普通笔记集合。

## 项目定位

一句话：

“这是一个技术服务工程师 toolkit，把排障、部署支持、问题闭环和知识复用沉淀成 docs、templates、scripts、examples 和蒸馏 skills。”

## 讲述逻辑

1. 问题：支持工作很容易散落在聊天、截图、零散日志和个人经验里。
2. 方法：先定义现象，再缩小范围，提出假设，用证据验证，同步进展，验证恢复，最后沉淀经验。
3. 实现：docs 写方法，templates 做记录，scripts 收集证据，examples 展示用法，skills 方便复用。
4. 边界：参考了公开英文资料，但内容全部重写，并在 `ATTRIBUTION.md` 记录来源边界。
5. 结果：仓库可运行、可审计、可解释，适合面试展示。

## 能力映射

| 面试能力 | 展示内容 |
| --- | --- |
| Linux 和网络基础 | `docs/linux_quick_reference.md`, `docs/network_basics.md` |
| 结构化排障 | `docs/troubleshooting_flow.md`, `templates/incident_report_template.md` |
| 部署支持 | `docs/deployment_checklist.md`, `templates/deployment_record_template.md` |
| 客户沟通 | `examples/sample_field_support_case.md` |
| 自动化意识 | `scripts/system_health_check.sh`, `scripts/collect_logs.sh` |
| 问题闭环 | `templates/issue_closure_template.md` |
| 知识复用 | `skills/`, `docs/toolkit_usage_guide.md` |

## 推荐展示顺序

1. 打开 `README.zh-CN.md`，说明仓库为什么存在。
2. 打开 `docs/troubleshooting_flow.md`，用 30 秒讲排障流程。
3. 展示 `scripts/collect_logs.sh`，说明轻量采集和降级处理。
4. 展示 `examples/sample_incident_filled.md`，证明模板不是空架子。
5. 展示 `skills/interview_usage_skill.zh-CN.md`，说明你有知识复用意识。

## 示例话术

“我做这个仓库，是因为技术服务工程师不是只会命令就够了。真正重要的是能把问题讲清楚、把范围缩小、用证据验证判断、把进展同步给客户、把部署过程控制住，并在最后形成可复用经验。这个仓库把这些能力拆成了文档、模板、脚本、示例和 skills，可以直接展示我的排障方法和工程化沉淀能力。”

## 避免这样说

- “这个仓库能解决所有支持问题。”
- “这是官方事故响应框架。”
- “这些脚本足够做生产级诊断。”
- “我复制了成熟模板。”

更合适的说法：

- “这是一个轻量的个人方法论仓库。”
- “它需要根据具体环境调整。”
- “它展示我如何结构化支持工作并沉淀可复用资产。”
