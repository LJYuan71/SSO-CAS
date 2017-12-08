package tk.ljyuan71.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import tk.ljyuan71.web.dao.PermissionMapper;
import tk.ljyuan71.web.dao.RoleMapper;
import tk.ljyuan71.web.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	@Resource
	private RoleMapper roleMapper;
	@Resource
	private PermissionMapper permissionMapper;

	@Override
	public List<String> getPermissions(String account) {
		
		return permissionMapper.getPermissions(account);
	}

	@Override
	public List<String> getRoles(String account) {
		
		return roleMapper.getRoles(account);
	}

}
