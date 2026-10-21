# 案例1：学生选课系统

## 1. 项目简介

本项目是一个基于 Java Web 技术开发的**学生选课系统**，旨在为学校提供一套简洁高效的选课管理方案。系统支持学生、教师和管理员三种角色登录，不同角色拥有各自独立的功能菜单和操作界面，实现了用户身份验证、会话管理以及基于角色的页面分发等核心功能。

## 2. 功能实现

### 2.1 用户登录与身份验证

- 用户在登录页面输入用户名和密码，登录流程调用 `UserLogin.validlogin()` 通过 `PreparedStatement` 预编译查询 MySQL 数据库进行校验，防止 SQL 注入
- 登录成功后将用户信息存入 Session，根据用户类型自动跳转到对应角色主页
- 登录失败时在页面提示错误信息

### 2.2 多角色支持

系统支持三种用户角色，登录后自动分发到各自的主页：

| 角色 | 主页文件 | 功能菜单 |
|------|----------|----------|
| 学生 | `Student.jsp` | 选课中心、已选课程、成绩查询、课表查看、个人信息 |
| 教师 | `Teacher.jsp` | 我的课程、学生管理、成绩录入、成绩统计、个人信息 |
| 管理员 | `Admin.jsp` | 系统概览、用户管理、课程管理、选课管理、系统设置 |

### 2.3 会话管理与退出功能

- 登录成功后通过 `HttpSession` 保存用户对象，页面通过 EL 表达式读取用户信息
- 公共头部（`header.jsp`）展示当前登录用户名和角色类型
- 点击"退出系统"按钮，`LogoutServlet` 销毁 Session 并重定向回登录页

### 2.4 各角色权限区分

- 三种角色使用独立的 JSP 页面，左侧菜单项各不相同
- 公共头部通过 `${user.type}` 动态展示当前用户角色
- 后续可扩展为基于角色的接口权限控制

## 3. 技术栈

| 技术分类 | 技术 / 版本 |
|----------|-------------|
| **JDK** | Oracle OpenJDK 21 |
| **后端** | Java + Jakarta Servlet 6.1 |
| **前端** | JSP、HTML5、CSS3 |
| **数据库** | MySQL 8.0 + MySQL Connector/J 8.0.33 |
| **构建工具** | Maven 3（maven-war-plugin 3.4.0） |
| **测试** | JUnit Jupiter 5.11.0 |
| **Web 规范** | Jakarta EE Web App 6.0 |

## 4. 数据库设计

### 4.1 数据库信息

- 数据库名称：`javawebdb`
- 连接地址：`jdbc:mysql://localhost:3306/javawebdb?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true`

### 4.2 用户表（`user`）

| 字段名 | 类型 | 说明 |
|--------|------|------|
| `id` | `int` | 主键，自增，用户唯一标识 |
| `username` | `varchar` | 用户名（学号 / 工号） |
| `password` | `varchar` | 登录密码 |
| `sex` | `varchar` | 性别 |
| `age` | `int` | 年龄 |
| `birthday` | `varchar` | 出生日期 |
| `type` | `varchar` | 用户类型：`学生` / `教师` / `管理员` |

> **主键**：`id`  
> **无外键关联**，各角色表可后续扩展。

## 5. 项目结构

```
case1/
├── src/
│   ├── main/
│   │   ├── java/sdjzu/case1/
│   │   │   ├── dao/                    # 数据访问层
│   │   │   │   └── UserLogin.java      # 用户登录验证（validlogin1 拼接 SQL、validlogin 预编译两种实现）
│   │   │   ├── entity/                 # 实体类
│   │   │   │   └── User.java           # 用户实体（id, username, password, type 等）
│   │   │   ├── servlet/                # 控制层（Servlet）
│   │   │   │   ├── LoginServlet.java   # 处理登录请求（/login）
│   │   │   │   └── LogoutServlet.java  # 处理退出请求（/logout）
│   │   │   └── util/                   # 工具类
│   │   │       └── DBConnection.java   # 数据库连接与资源关闭
│   │   ├── resources/                  # 资源文件
│   │   └── webapp/                     # Web 根目录
│   │       ├── WEB-INF/
│   │       │   └── web.xml             # Web 应用配置文件（Jakarta EE 6.0）
│   │       ├── css/
│   │       │   ├── style.css           # 登录页样式
│   │       │   └── main.css            # 主页公共布局样式
│   │       ├── mainPage/
│   │       │   ├── header.jsp          # 公共头部（系统名称、用户信息、退出按钮）
│   │       │   ├── footer.jsp          # 公共底部（版权信息）
│   │       │   ├── Student.jsp         # 学生主页
│   │       │   ├── Teacher.jsp         # 教师主页
│   │       │   └── Admin.jsp           # 管理员主页
│   │       └── index.jsp               # 登录页面
│   └── test/                           # 测试代码
├── pom.xml                             # Maven 项目配置文件
└── README.md                           # 项目说明文档
```

### 各包说明

| 包名 | 职责 |
|------|------|
| `sdjzu.case1.dao` | 数据访问层，封装数据库查询逻辑 |
| `sdjzu.case1.entity` | 实体类，对应数据库表结构 |
| `sdjzu.case1.servlet` | 控制层，处理 HTTP 请求并调度业务逻辑 |
| `sdjzu.case1.util` | 工具类，提供数据库连接和资源关闭等公共方法 |

## 6. 运行说明

### 6.1 环境要求

- **JDK 21** 或以上
- **Maven 3** 及以上
- **MySQL 8.0** 数据库
- **Servlet 容器**：Apache Tomcat 10.1+（Tomcat 10.1 支持 Servlet 6.0，Tomcat 11 支持 Servlet 6.1）

### 6.2 数据库配置

1. 在 MySQL 中创建数据库和数据表：

```sql
CREATE DATABASE javawebdb CHARACTER SET utf8mb4;

USE javawebdb;

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    sex VARCHAR(10),
    age INT,
    birthday VARCHAR(20),
    type VARCHAR(20) NOT NULL
);
```

2. 根据需要修改 `DBConnection.java` 中的数据库连接信息（地址、用户名、密码）。

### 6.3 构建与部署（Tomcat中单独部署）

```bash
# 构建 WAR 包
mvn clean package

# 将 target/case1-1.0-SNAPSHOT.war 部署到 Tomcat 的 webapps 目录下
# 进入Tomcat 的 bin目录，运行startup.bat启动Tomcat，然后访问：http://localhost:8080/case1-1.0-SNAPSHOT/
```

### 6.4 IntelliJ IDEA 运行

1. 使用 IDEA 打开项目
2. 配置 Tomcat 服务器（Run → Edit Configurations → Tomcat Server）
3. 部署 WAR exploded 工件
4. 运行即可自动打开登录页面（http://localhost:8080/case1_war_exploded/index.jsp）
## 软件运行环境

1. **JDK（Java 开发工具包）**
    - 示例：JDK 21
    - 选型理由：Servlet、Tomcat 依赖，兼容 JDBC 驱动，稳定性强
2. **Web 服务器：Apache Tomcat**
    - 示例：Tomcat 11
    - 选型理由：轻量免费 Servlet 容器，部署 JavaWeb 项目，支持 Servlet/JSP
3. **数据库：MySQL**
    - 示例：MySQL 5.7
    - 选型理由：开源关系型数据库，学习 JavaWeb 最常用，适配 JDBC，支持 utf8mb4 中文
4. **项目构建工具：Maven**
    - 选型理由：自动管理 jar 包依赖（mysql 驱动等），一键编译打包，统一项目环境