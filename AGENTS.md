# 火星人天气预报 - 项目规范

## 项目概述

静态 HTML 网站项目，展示"火星人天气预报"主题页面。项目结构简单，仅包含一个 `index.html` 文件和静态资源（图片、音乐）。

## 技术栈

- **项目类型**：Web 静态站点
- **运行时**：Python 3（用于静态服务器）
- **预览/部署方式**：Python http.server 提供静态服务

## 目录结构

```
/workspace/projects/
├── .coze                    # Coze 项目配置
├── AGENTS.md                # 项目规范（本文档）
├── index.html                # 主页面
├── scripts/
│   ├── coze-preview-build.sh   # 预览构建脚本
│   ├── coze-preview-run.sh      # 预览运行脚本
│   ├── coze-deploy-build.sh     # 部署构建脚本
│   └── coze-deploy-run.sh       # 部署运行脚本
├── images/                  # 图片资源
├── img/                     # 图片资源
├── music/                   # 音乐资源
└── _img_cache/              # 图片缓存
```

## 关键入口

- **主页面**：`index.html`
- **预览命令**：`bash scripts/coze-preview-run.sh`
- **部署命令**：`bash scripts/coze-deploy-run.sh`

## 运行与预览

### 预览
```bash
bash scripts/coze-preview-build.sh  # 构建检查
bash scripts/coze-preview-run.sh     # 启动预览服务（5000 端口）
```

### 部署
```bash
bash scripts/coze-deploy-build.sh    # 部署构建
bash scripts/coze-deploy-run.sh       # 启动部署服务（5000 端口）
```

## Coze 配置

- **sub_id**：`bc8a442f`
- **project_type**：`web`
- **requires**：`python-3.12`
- **preview_enable**：`enabled`
- **deploy.profile.kind**：`service`
- **deploy.profile.flavor**：`web`

## 用户偏好与长期约束

1. 服务端口固定为 `5000`，不得修改
2. 使用 Python http.server 提供静态服务
3. 脚本基于自身位置定位项目目录，不依赖当前工作目录
4. 幂等性：端口清理后再启动，避免进程冲突

## 常见问题和预防

1. **端口占用**：启动前自动清理 5000 端口残留进程
2. **工作目录**：脚本内部使用 `cd "$(dirname "$0")"` 定位项目根目录
3. **静态资源**：所有资源路径相对于 `index.html` 所在目录解析
