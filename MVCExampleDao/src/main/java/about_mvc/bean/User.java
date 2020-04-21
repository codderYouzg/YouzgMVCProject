package about_mvc.bean;

import java.io.Serializable;
import java.util.Objects;

/**
 * @Author: Youzg
 * @CreateTime: 2020-04-19 20:35
 * @PROJECT: YouzgWebs
 * @PACKAGE: edu.youzg.about_mvc
 * @Description:
 */
public class User implements Serializable {
    public static final long serialVersionUID = 42L;
    private String name;
    private String password;

    public User() {
    }

    public User(String name, String password) {
        this.name = name;
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true ;
        };
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        User user = (User) o;
        return password == user.password &&
                Objects.equals(name, user.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, password);
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", age=" + password +
                '}';
    }

}
