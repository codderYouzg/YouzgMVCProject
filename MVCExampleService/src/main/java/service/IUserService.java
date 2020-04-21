package service;

import about_mvc.bean.User;

/**
 * @Author: Youzg
 * @CreateTime: 2020-04-19 20:41
 * @PROJECT: YouzgWebs
 * @PACKAGE: edu.youzg.about_mvc.service
 * @Description:
 */
public interface IUserService {
    public boolean saveUser(User user) throws Exception;
    public User login(User user) throws Exception;
    public boolean isPresent(String name) throws Exception;
}
