+++
date = '2025-12-26T15:19:41+08:00'
draft = false
title = 'Hugo的语法实列'
+++



## Hugo + PaperMod Markdown 写作完整示例



> 本文档是一份 **可直接照抄使用的 Markdown 编写规范**，适用于：

>

> * Hugo（Goldmark 渲染器）

> * PaperMod 主题

> * 技术博客 / 笔记 / 教程写作



---



## 一、文章头部（Front Matter）【必须】



```yaml

---

title: "Antigravity 不能选择模型的解决方案"

date: 2025-12-26T10:30:00+08:00

draft: true

slug: antigravity-model-select-fix

tags:

&nbsp; - Hugo

&nbsp; - 博客

&nbsp; - 排错

categories:

&nbsp; - 技术

---

```



### 说明



* `title`：文章标题（可中文）

* `draft`：



&nbsp; * `true`：草稿（本地可见，线上不发布）

&nbsp; * `false`：正式发布

* `slug`：URL 路径（**强烈建议使用英文**）

* `tags / categories`：PaperMod 支持



---



## 二、标题规范



```markdown
#符号前面不能有任何东西,否则hugo不能正常渲染

# 一级标题（通常不用）

## 二级标题（正文主标题）

### 三级标题

#### 四级标题

```



### 注意事项



* `##   测试` 和 `## 测试` **效果相同**（多余空格会被忽略）

* 不要跳级（不要直接从 `##` 跳到 `####`）



---



## 三、段落与换行（非常重要）



### 正确的段落写法



```markdown

这是第一段。



这是第二段。

```



效果：



这是第一段。



这是第二段。



---



### 强制换行（推荐方式）



```markdown

第一行␠␠

第二行

```



> 行尾 **两个空格 + 回车**



---



### ❌ 不推荐写法



```markdown

标题1 <br/>

```



原因：



* HTML 标签在某些主题下可能被过滤

* 可读性差



---



## 四、代码块（最常用）



### 标准代码块（强烈推荐）



````markdown

```go

import "fmt"



func main() {

&nbsp;	fmt.Println("hello world")

}

```

````



### 规则（非常关键）



1. 三个反引号 **必须单独一行**

2. 不要缩进代码块

3. 语言标识写在开头（如 `go`、`bash`、`json`）



---



### 行内代码



```markdown

使用 `fmt.Println()` 输出内容

```



效果：



使用 `fmt.Println()` 输出内容



---



## 五、列表



### 无序列表



```markdown

- 第一项

- 第二项

&nbsp; - 子项 1

&nbsp; - 子项 2

```



### 有序列表



```markdown

1. 第一步

2. 第二步

3. 第三步

```



---



## 六、引用（说明 / 提示）



```markdown

> 这是一个重要说明

```



效果：



> 这是一个重要说明



---



## 七、链接与图片



### 链接



```markdown

[Hugo 官网](https://gohugo.io)

```



### 图片（推荐放在 static/ 目录）



```markdown

![示意图](/images/example.png)

```



---



## 八、表格（需 Goldmark 扩展）



```markdown

| 参数 | 说明 | 是否必须 |

|------|------|----------|

| title | 标题 | 是 |

| date  | 时间 | 是 |

| slug  | URL  | 推荐 |

```



---



## 九、任务列表



```markdown

- [x] 初始化博客

- [x] 配置自动部署

- [ ] 写第一篇文章

```



---



## 十、分割线



```markdown

---

```



效果：



---



## 十一、PaperMod + Hugo 推荐写作模板（直接复制）



````markdown

---

title: ""

date: 2025-12-26

draft: true

slug:

tags: []

categories: []

---



## 背景





## 问题描述





## 解决方案



```go

// 示例代码

```



## 注意事项





## 总结



````



---



## 十二、最重要的三条规则（请牢记）



1. **段落之间一定要空一行**

2. **代码块反引号必须独占一行**

3. **不要依赖 `<br/>`，用 Markdown 原生换行**



---



如果你愿意，下一步我可以：



* 给你一份 **技术博客写作 Checklist**

* 或直接按你的风格定制一个 **个人专用 Hugo 写作模板**



