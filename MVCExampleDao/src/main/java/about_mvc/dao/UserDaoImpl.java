package about_mvc.dao;

import about_mvc.dao_util.JDBCUtils;

/**
 * @Author: Youzg
 * @CreateTime: 2020-04-19 21:24
 * @PROJECT: YouzgWebs
 * @PACKAGE: edu.youzg.about_mvc.bean
 * @Description:
 */
public class UserDaoImpl implements IUserDao {

    public boolean checkLogin(String userName, String password) throws Exception {
        return JDBCUtils.allowLogin(userName, password);
    }

    public boolean saveUser(String userName, String password) throws Exception {
        if (!JDBCUtils.isPresent(userName)) {
            return JDBCUtils.saveUser(userName, password);
        }
        return false;
    }

}
