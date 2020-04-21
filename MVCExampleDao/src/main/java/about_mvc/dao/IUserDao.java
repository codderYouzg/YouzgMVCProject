package about_mvc.dao;

/**
 * @Author: Youzg
 * @CreateTime: 2020-04-19 21:22
 * @PROJECT: YouzgWebs
 * @PACKAGE: edu.youzg.about_mvc.bean
 * @Description:
 */
public interface IUserDao {
    boolean checkLogin(String userName, String password) throws Exception;
    boolean saveUser(String userName, String password) throws Exception;
}
