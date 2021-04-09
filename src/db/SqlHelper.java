package db;

/**
 * 功能：用于连接数据库
 */

import java.sql.*;

public class SqlHelper {
    // 数据库变量
    private Connection ct = null;
    private PreparedStatement ps = null;
    private Statement st = null;
    private ResultSet rs = null;
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/javaweb";
    private String username = "root";
    private String password = "Lh1124015891";

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Connection getCt() {
        return ct;
    }

    public void setCt(Connection ct) {
        this.ct = ct;
    }

    public PreparedStatement getPs() {
        return ps;
    }

    public void setPs(PreparedStatement ps) {
        this.ps = ps;
    }

    public ResultSet getRs() {
        return rs;
    }

    public void setRs(ResultSet rs) {
        this.rs = rs;
    }

    // 构造方法，用于初始化连接
    public SqlHelper() {
        try {
            // 连接驱动
            Class.forName(driver);
            // 获取连接
            ct = DriverManager.getConnection(url, username, password); //建立数据库连接，获得连接对象conn
            System.out.println("数据库连接成功");
        } catch (ClassNotFoundException e) {
            System.out.println("数据库连接失败");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("数据库连接失败");
            e.printStackTrace();
        }
    }

    // 查询功能
    public ResultSet queryExecute(String sql, String[] paras) {
        try {
            // 创建PreparedStatement
            ps = ct.prepareStatement(sql);
            // 给ps参数赋值
            for (int i = 0; i < paras.length; i++) {
                ps.setString(i + 1, paras[i]);
            }
            //执行操作
            rs = ps.executeQuery();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public ResultSet queryExecute(String sql) {
        try {
            //执行操作
            st = ct.createStatement();
            rs = st.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }

    // 添加功能
    public void addAccount(String sql, String[] paras) {
        try {
            // 创建PreparedStatement
            ps = ct.prepareStatement(sql);
            // 给ps参数赋值
            for (int i = 0; i < paras.length; i++) {
                ps.setString(i + 1, paras[i]);
            }
            //执行操作
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addAccount(String sql) {
        try {
            // 创建Statement
            st = ct.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void changeMsg(String sql, String[] paras)  {
        try {
            // 创建PreparedStatement
            ps = ct.prepareStatement(sql);
            // 给ps参数赋值
            for (int i = 0; i < paras.length; i++) {
                ps.setString(i + 1, paras[i]);
            }
            //执行操作
            ps.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // 关闭数据库资源
    public void close() {
        // 关闭资源
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (ct != null) {
                ct.close();
            }
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

    public static void main(String[] args) {
        SqlHelper sqlHelper = new SqlHelper();
    }
}
