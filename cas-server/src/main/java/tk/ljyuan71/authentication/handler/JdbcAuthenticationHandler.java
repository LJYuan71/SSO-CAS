package tk.ljyuan71.authentication.handler;

import java.security.GeneralSecurityException;

import javax.security.auth.login.AccountNotFoundException;
import javax.security.auth.login.FailedLoginException;
import javax.sql.DataSource;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang.StringUtils;
import org.jasig.cas.authentication.BasicCredentialMetaData;
import org.jasig.cas.authentication.HandlerResult;
import org.jasig.cas.authentication.PreventedException;
import org.jasig.cas.authentication.UsernamePasswordCredential;
import org.jasig.cas.authentication.handler.support.AbstractUsernamePasswordAuthenticationHandler;
import org.jasig.cas.authentication.principal.SimplePrincipal;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 * @author ljyuan 2017年12月5日
 * @Description:  cas数据库验证用户
 */
public class JdbcAuthenticationHandler extends AbstractUsernamePasswordAuthenticationHandler {
	
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	@NotNull
	private DataSource dataSource;

	@NotNull
	private JdbcTemplate jdbcTemplate;

	@NotNull
	private String sql;
	
	/* (non-Javadoc)
	 * @see org.jasig.cas.authentication.handler.support.AbstractUsernamePasswordAuthenticationHandler#authenticateUsernamePasswordInternal(org.jasig.cas.authentication.UsernamePasswordCredential)
	 */
	@Override
	protected HandlerResult authenticateUsernamePasswordInternal(
			UsernamePasswordCredential credential) throws GeneralSecurityException,
			PreventedException {
		String username = credential.getUsername();
		 if (StringUtils.isBlank(username)){
			 System.err.println("用户名为空,不能登录");
			 throw new AccountNotFoundException("未找到用户");
		 }
        String encryptedPassword = getPasswordEncoder().encode(credential.getPassword());
        try {
        	//通过用户名称去数据库获取密码
            String dbPassword = jdbcTemplate.queryForObject(this.sql, String.class, new Object[]{username});
            if (!dbPassword.trim().equals(encryptedPassword)) {
            	System.err.println("密码不匹配");
            	throw new FailedLoginException("账号密码不匹配");
            }
        } catch (IncorrectResultSizeDataAccessException e) {
        	e.printStackTrace();
            if (e.getActualSize() == 0) {
                throw new AccountNotFoundException(new StringBuilder(String.valueOf(username)).append("账号密码不匹配").toString());
            }
            throw new FailedLoginException("账号密码不匹配: " + username);
        } catch (DataAccessException e2) {
            e2.printStackTrace();
            throw new PreventedException("执行SQL查询出错" + username, e2);
        }
        logger.info(username+"登录成功!");
        //return new HandlerResult(this, new BasicCredentialMetaData(credential), new SimplePrincipal(credential.getId()), null);
        return createHandlerResult(credential, new SimplePrincipal(username), null);
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public void setSql(String sql) {
		this.sql = sql;
	}
	
}
