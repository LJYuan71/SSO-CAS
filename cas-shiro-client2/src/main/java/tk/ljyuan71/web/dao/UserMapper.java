package tk.ljyuan71.web.dao;

import org.apache.ibatis.annotations.Param;

import tk.ljyuan71.web.model.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User getUserByAccount(@Param("account")String account);
}