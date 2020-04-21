package service;

import about_mvc.bean.User;
import about_mvc.dao.IUserDao;
import about_mvc.dao.UserDaoImpl;
import about_mvc.dao_util.JDBCUtils;

/**
 * @Author: Youzg
 * @CreateTime: 2020-04-19 20:43
 * @PROJECT: YouzgWebs
 * @PACKAGE: edu.youzg.about_mvc.service
 * @Description:
 */
public class UserServiceImpl implements IUserService {

    public boolean saveUser(User user) throws Exception {
        return new UserDaoImpl().saveUser(user.getName(), user.getPassword());
    }

    public User login(User user) throws Exception {
        IUserDao userDao = new UserDaoImpl();
        boolean b = userDao.checkLogin(user.getName(), user.getPassword());
        return b ? user : null;
    }

    public boolean isPresent(String name) throws Exception {
        return JDBCUtils.isPresent(name);
    }

}
