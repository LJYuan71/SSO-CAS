<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<body>
	<h1>这是应用1</h1>
	<span>欢迎您,${user.username }</span></br>
	<span>角色权限</span></br>
	<shiro:hasRole name="admin">
		<button>admin-查询</button>
	</shiro:hasRole>
	<shiro:hasRole name="user">
		<button>user-查询</button>
	</shiro:hasRole>
	<shiro:hasRole name="manager">
		<button>manager-查询</button>
	</shiro:hasRole>
	</br>
	<span>资源权限</span></br>
	<shiro:hasPermission name="query">
		<button>查询</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="add">
		<button>添加</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="del">
		<button>删除</button>
	</shiro:hasPermission>
	</br>
	
	<shiro:hasPermission name="model:query">
		<button>model查询</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="model:add">
		<button>model添加</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="model:del">
		<button>model删除</button>
	</shiro:hasPermission>
	</br>
	
	<a href="http://127.0.0.1:8082/shiro2/" target="_blank">前往应用2</a>
	<a href="http://127.0.0.1:8081/shiro1/logout">单点登出</a>
</body>
</html>