# tech-service-engineer-toolkit

[English](README.md) | 中文

`tech-service-engineer-toolkit` 是一个面向 Technical Service Engineer、Field Support、Troubleshooting、Deployment Support 岗位的个人方法论与工程化工具仓库。

它通过可复用文档、模板、轻量脚本、示例和蒸馏 skills，展示结构化排障、部署支持、问题闭环、客户沟通和知识复用能力。

## 为什么做这个仓库

技术服务工作最容易失控的地方，不是缺一个命令，而是信息散落在聊天、截图、零散日志和个人经验里。这个仓库把支持工作整理成一个可重复的闭环：

```text
现象 -> 范围 -> 假设 -> 验证 -> 结论 -> 同步 -> 闭环 -> 可复用知识
```

本仓库不追求做成庞大的运维平台，而是保持小而精、可信、可运行、适合面试展示，体现如何把支持工作结构化并沉淀为资产。

## 面向岗位和场景

适合：

- 技术服务工程师
- 现场支持工程师
- 应用支持工程师
- 部署支持工程师
- 排障或升级支持类岗位
- 面向技术支持岗位的面试准备

典型场景：

- Linux 主机健康检查
- 基础网络排障
- 客户故障记录
- 现场支持 checklist
- 部署记录和验收
- 问题闭环和经验沉淀
- 面试中的项目展示

## 仓库结构

```text
.
├── README.md
├── README.zh-CN.md
├── LICENSE
├── .gitignore
├── ATTRIBUTION.md
├── research/
│   └── related_projects.md
├── docs/
│   ├── network_basics.md
│   ├── linux_quick_reference.md
│   ├── troubleshooting_flow.md
│   ├── deployment_checklist.md
│   ├── security_basics.md
│   ├── service_engineer_interview_mapping.md
│   └── toolkit_usage_guide.md
├── templates/
│   ├── incident_report_template.md
│   ├── field_support_checklist.md
│   ├── deployment_record_template.md
│   └── issue_closure_template.md
├── scripts/
│   ├── system_health_check.sh
│   ├── collect_logs.sh
│   ├── network_basic_check.sh
│   └── verify_toolkit.sh
├── examples/
│   ├── sample_incident_filled.md
│   ├── sample_field_support_case.md
│   └── sample_deployment_record.md
├── skills/
│   ├── tech_service_engineer_toolkit_skill.zh-CN.md
│   ├── tech_service_engineer_toolkit_skill.en.md
│   ├── troubleshooting_skill.zh-CN.md
│   ├── troubleshooting_skill.en.md
│   ├── interview_usage_skill.zh-CN.md
│   └── interview_usage_skill.en.md
└── meta/
    ├── github_about_zh.txt
    ├── github_about_en.txt
    ├── repo_summary_zh.txt
    └── repo_summary_en.txt
```

## 目录说明

| 目录 | 作用 |
| --- | --- |
| `docs/` | 核心技术速查和支持方法论，建议先看 `docs/troubleshooting_flow.md` 和 `docs/toolkit_usage_guide.md`。 |
| `templates/` | 故障、现场支持、部署、问题闭环的 Markdown 模板。 |
| `scripts/` | 主机健康检查、日志收集、网络检查、仓库一致性验证的轻量 Bash 脚本。 |
| `examples/` | 已填写示例，用来展示模板应该怎么写。 |
| `skills/` | 给 AI 代理、协作者或未来自己的蒸馏版操作说明。 |
| `research/` | 公开英文资料调研和本地工作区扫描结果。 |
| `meta/` | GitHub About 文案和仓库简短介绍。 |

## 快速开始

```bash
git clone <repo-url>
cd tech-service-engineer-toolkit
./scripts/verify_toolkit.sh
```

快速主机检查：

```bash
./scripts/system_health_check.sh
```

基础网络检查：

```bash
./scripts/network_basic_check.sh example.com
```

收集支持包：

```bash
./scripts/collect_logs.sh
```

脚本刻意保持轻依赖。如果 `ip`、`ss`、`journalctl`、`free`、`lsblk` 等命令不存在，脚本会输出 skip 或 warning，并尽量使用可用替代项继续执行。

## 如何运行脚本

| 脚本 | 作用 | 示例 |
| --- | --- | --- |
| `scripts/system_health_check.sh` | 输出主机名、系统信息、uptime、CPU、内存、磁盘、网卡、路由、DNS、监听端口和最近日志。 | `./scripts/system_health_check.sh` |
| `scripts/collect_logs.sh` | 生成 `.tar.gz` 支持包，包含主机、系统、磁盘、内存、网络、进程、端口、服务和最近日志快照。 | `./scripts/collect_logs.sh -o /tmp` |
| `scripts/network_basic_check.sh` | 检查本机 IP、默认路由、DNS 配置、默认网关连通性，以及可选目标连通性。 | `./scripts/network_basic_check.sh example.com` |
| `scripts/verify_toolkit.sh` | 验证 docs、templates、scripts、examples、skills、脚本权限和 README 引用。 | `./scripts/verify_toolkit.sh` |

在分享脚本输出或支持包之前，请先脱敏 secret、token、客户标识、私有数据和敏感环境信息。

## 如何使用模板

模板应该在工作过程中使用，而不是事后补表：

1. 新故障出现时，打开 `templates/incident_report_template.md`。
2. 现场或远程支持时，使用 `templates/field_support_checklist.md`。
3. 部署前、中、后，使用 `templates/deployment_record_template.md`。
4. 关闭问题前，使用 `templates/issue_closure_template.md`。
5. 参考 `examples/sample_incident_filled.md`、`examples/sample_field_support_case.md`、`examples/sample_deployment_record.md` 的填写粒度。

## 如何使用蒸馏 Skills

`skills/` 文件是从整个仓库蒸馏出来的紧凑操作说明。它们适合交给 AI 代理、协作者，或未来的自己快速执行工作流。

推荐路径：

- `skills/tech_service_engineer_toolkit_skill.en.md`
- `skills/tech_service_engineer_toolkit_skill.zh-CN.md`
- `skills/troubleshooting_skill.en.md`
- `skills/troubleshooting_skill.zh-CN.md`
- `skills/interview_usage_skill.en.md`
- `skills/interview_usage_skill.zh-CN.md`

典型用法：

1. 选择匹配场景的 skill。
2. 按 skill 里的“先读什么”或输入要求执行。
3. 调用对应 docs、templates 和 scripts。
4. 按推荐输出格式写结论。
5. 闭环时写清验证、Owner、风险和可复用经验。

示例：

```text
处理网络相关客户问题时，先读：
1. skills/troubleshooting_skill.zh-CN.md
2. docs/network_basics.md
3. templates/incident_report_template.md

然后运行：
./scripts/network_basic_check.sh <target>
```

## 典型使用场景

### 1. 未知客户故障

- 先看 `docs/troubleshooting_flow.md`。
- 用 `templates/incident_report_template.md` 记录事实。
- 运行 `scripts/system_health_check.sh`。
- 若涉及网络，运行 `scripts/network_basic_check.sh <target>`。
- 使用 `templates/issue_closure_template.md` 做闭环。

### 2. 部署支持

- 阅读 `docs/deployment_checklist.md`。
- 使用 `templates/deployment_record_template.md`。
- 部署前后运行 `scripts/system_health_check.sh`。
- 记录验收结论和剩余风险。

### 3. 升级或交接支持包

- 运行 `scripts/collect_logs.sh`。
- 按排障更新格式补充简短摘要。
- 外发前脱敏支持包。
- 附上相关故障或现场支持模板。

### 4. 面试展示

- 阅读 `docs/service_engineer_interview_mapping.md`。
- 展示 `docs/troubleshooting_flow.md`、一个脚本、一个模板、一个示例和一个 skill。
- 使用 `meta/repo_summary_en.txt` 或 `meta/repo_summary_zh.txt` 做简短项目总结。

## 与第三方项目的关系

本仓库在构建前研究了公开英文资料和相关仓库，包括 Google SRE 事故响应资料、NIST 和 CISA 事故响应指南、公开事故响应模板、Linux/网络排障参考、部署 checklist 示例和支持诊断工具。

本仓库没有大段复制第三方 README、源码、模板或官方文档。凡是学习了思路或结构的来源，均记录在 `research/related_projects.md` 和 `ATTRIBUTION.md` 中。

## 引用说明

主要参考包括：

- [Google SRE Workbook: Incident Response](https://sre.google/workbook/incident-response/)
- [NIST SP 800-61r3 Incident Response Recommendations](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r3.pdf)
- [CISA Federal Government Cybersecurity Incident and Vulnerability Response Playbooks](https://www.cisa.gov/ncas/current-activity/2021/11/16/new-federal-government-cybersecurity-incident-and-vulnerability)
- [Counteractive Incident Response Plan Template](https://github.com/counteractive/incident-response-plan-template)
- [AWS Incident Response Playbook Samples](https://github.com/aws-samples/aws-incident-response-playbooks)
- [linux-network-troubleshooting](https://bertvv.github.io/linux-network-troubleshooting/tldr-checklist.html)
- [Cisco Troubleshooting TCP/IP](https://www.cisco.com/en/US/docs/internetworking/troubleshooting/guide/tr1907.html)
- [Elastic Support Diagnostics](https://github.com/elastic/support-diagnostics)
- [Microsoft SQL LogScout](https://github.com/microsoft/SQL_LogScout)
- [GitHub Support Docs: Getting Help](https://docs.github.com/en/actions/how-tos/get-support)

具体来源边界见 `ATTRIBUTION.md`。

## 后续扩展建议

可以继续扩展：

- 增加 Windows PowerShell 诊断脚本。
- 增加 Web 应用、数据库、VPN、IoT gateway 等服务专项 checklist。
- 增加支持包脱敏辅助工具。
- 增加 GitHub Actions，检查 Markdown 链接和 shell 语法。
- 增加 high CPU、disk full、DNS failure、certificate expiry 等填写示例。
- 增加可选 `docs/known_issue_index.md`，沉淀重复支持案例。

## License

本仓库原创内容使用 MIT License。第三方参考资料仍归其原始许可证和条款约束。
