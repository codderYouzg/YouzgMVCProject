package about_mvc.dao_util;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import org.apache.commons.dbutils.QueryRunner;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

/**
 * @Author: Youzg
 * @CreateTime: 2020-04-19 20:46
 * @PROJECT: YouzgWebs
 * @PACKAGE: edu.youzg.about_mvc.util
 * @Description:
 */
public class JDBCUtils {

    public static boolean allowLogin(String user, String password) throws Exception{
        Properties properties = new Properties();
        //注意web项目中普通的类，读取src下的文件
        InputStream in = JDBCUtils.class.getClassLoader().getResourceAsStream("druid.properties");
        properties.load(in);
        DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
        String sql = "select * from client where user_name=? and password=?";
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, user);
        statement.setString(2, password);
        //执行
        ResultSet resultSet = statement.executeQuery();
        return resultSet.next();
    }

    public static boolean saveUser(String userName, String password) throws Exception {
        Properties properties = new Properties();
        //注意web项目中普通的类，读取src下的文件
        InputStream in = JDBCUtils.class.getClassLoader().getResourceAsStream("druid.properties");
        properties.load(in);
        DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
        String sql="insert into client values (?,?)";
        QueryRunner queryRunner = new QueryRunner(dataSource);
        int i = queryRunner.update(sql, userName, password);
        return i>0;
    }

    public static boolean isPresent(String userName) throws Exception{
        Properties properties = new Properties();
        //注意web项目中普通的类，读取src下的文件
        InputStream in = JDBCUtils.class.getClassLoader().getResourceAsStream("druid.properties");
        properties.load(in);
        DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
        String sql = "select * from client where user_name=?";
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, userName);
        //执行
        ResultSet resultSet = statement.executeQuery();
        return resultSet.next();
    }

}