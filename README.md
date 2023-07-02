# Gitea Action 企业微信消息发送插件
通过企业微信自定义应用发送通知，支持执行失败后发送失败通知、自定义模板

## 消息类型
- [x] 文本消息 `text`
- [x] 文本卡片消息 `textcard` 
- [x] markdown消息 `markdown`
- [ ] 图片消息 `image`
- [ ] 文件消息 `file`
- [ ] 图文消息 `mpnews`

## 发送模式
- [x] 调用时发送 `main`
- [x] 完成时发送 `post`

## 使用方式

### 文本卡片消息示例

```yaml
- name: 企业微信文本卡片消息发送
  uses: zhangxr/work-wechat-send-action@main
  with:
    wechat_id: xxxx # 企业微信id
    agent_secret: xxxx # 应用密钥
    agent_id: 1000002 #应用id
    to_user:  @all # 消息接收人，多个使用竖线|分割,默认为空发送给所有人
    msgtype: textcard
    send_step: main # 消息发送时机 main 正常流程  post action 执行完成后发送
    title: "卡片标题"
    content: "<div class=\\\"gray\\\">${{ gitea.event.head_commit.timestamp }}</div><div class=\\\"normal\\\">仓库名称：${{ gitea.event.repository.full_name }}</div><div class=\\\"normal\\\">分支名称：${{ gitea.ref_name }}</div><div class=\\\"normal\\\">工作流程：${{ gitea.workflow }}</div><div class=\\\"normal\\\">提交信息：${{ gitea.event.head_commit.id }}</div><div class=\\\"highlight\\\">${{ gitea.event.head_commit.message }}</div>" # 描述内容
    url: "${{ gitea.event.repository.html_url }}/src/branch/${{ gitea.ref_name }}" # 卡片跳转URL
    btntxt: "前往仓库" # 卡片按钮文本
```

### Markdown消息示例

```yaml
- name: 企业微信markdown消息发送
  uses: zhangxr/work-wechat-send-action@main
  with:
    wechat_id: xxxx # 企业微信id
    agent_secret: xxxx # 应用密钥
    agent_id: 1000002 #应用id
    to_user:  @all # 消息接收人，多个使用竖线|分割,默认为空发送给所有人
    msgtype: markdown
    send_step: main # 消息发送时机 main 正常流程  post action 执行完成后发送
    content: "您的会议室已经预定，稍后会同步到`邮箱` 
        >**事项详情** 
        >事　项：<font color=\"info\">开会</font> 
        >组织者：@miglioguan 
        >参与者：@miglioguan、@kunliu、@jamdeezhou、@kanexiong、@kisonwang 
        > 
        >会议室：<font color=\"info\">广州TIT 1楼 301</font> 
        >日　期：<font color=\"warning\">2018年5月18日</font> 
        >时　间：<font color=\"comment\">上午9:00-11:00</font> 
        > 
        >请准时参加会议。 
        > 
        >如需修改会议信息，请点击：
        >[修改会议信息](https://work.weixin.qq.com)"
```

## 自定义action参考文档
https://docs.github.com/cn/actions/creating-actions/about-custom-actions#further-reading


