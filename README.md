## Rails Girls Making a Pair App

This app is built for rails girls to making a pair between female participants and tutors.

### Main Functions

1. Registration  注册
2. Rails Girls event installation guides for Chinese  安装文档本土化
3. Admin tool  管理员可以在profile添加问题
4. User profile 用户的资料，主要用来做背景调查
5. Making a pair  两个功能，一个是签到，一个是配对。

	* 活动签到：需要设置一个密码，上午到门口的时候，我们就把密码发给girls 和 tutors，自己登入后用注册邮箱地址签到。
	* 自动配对：然后我们根据用户的role（user字段）不同， 自动匹配。后台可以设置匹配人数，例如 8个girls+4个tutors  一组。然后把结果输出来

### 业务

#### 用户类型
   1. Girl
   2. Tutor

#### 文档（指南）
   属于Event的body字段

#### 活动
   1. 每次活动为一次事件（Event），管理员发布活动从注册的用户中邀请用户
   2. 活动当天开放签到，有两种情况：受邀用户签到、非受邀用户
   3. 根据用户类型区分tutor和girl的签到
   4. 配对工具，将girls平均分配给tutors

#### 反馈表
   未完成，非紧急

### 邀请Tutors和Girls
   页面没写，控制台下```@event.invite_tutors; @event.rand_invite_girls(size)```

### 开发
   1. Clone
   2. ```bundle```
   3. ```cp config/database.yml.example config/database.yml``` and edit config/database.yml
   4. ```rake db:migrate && rake db:seed``` import demo data, default admin ```email: admin@demo.com password: aaaaaa```
   5. Coding
   6. Push and pull request

======
Beijing Rubyists group, MIT license
