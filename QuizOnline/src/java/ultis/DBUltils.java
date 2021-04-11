/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ultis;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import org.apache.log4j.Logger;

/**
 *
 * @author ADMIN
 */
public class DBUltils {

    static Logger log = Logger.getLogger(DBUltils.class.getName());

    public static Connection getConnection() {

        Connection connection = null;
        try {
            Properties propertie = new Properties();
            propertie.load(DBUltils.class.getResourceAsStream("config.properties"));
            String url = propertie.getProperty("jdbc.url");
            String driver = propertie.getProperty("jdbc.driver");
            String userName = propertie.getProperty("jdbc.username");
            String password = propertie.getProperty("jdbc.password");
            Class.forName(driver);
            connection = DriverManager.getConnection(url, userName, password);
        } catch (Exception e) {
            log.info(e.toString());
        }
        return connection;

    }
   

}
