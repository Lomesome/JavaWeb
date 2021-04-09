package dao;

import beans.Book;

import java.sql.*;
import java.util.HashMap;

public class BookDao {

    public Connection getConnection(String driver, String url, String user, String password) {
        Connection ct = null;
        try {
            // 连接驱动
            Class.forName(driver);
            // 获取连接
            ct = DriverManager.getConnection(url, user, password); //建立数据库连接，获得连接对象conn

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("数据库连接失败");
            e.printStackTrace();
        }
        return ct;
    }

    public HashMap<String, Book> getAllBook(Connection ct){
        HashMap<String, Book> bookHashMap = new HashMap<>();
        ResultSet rs = null;
        try {
            Statement statement = ct.createStatement();
            String sql = "SELECT bookno, bookname, bookprice, booknumber from books";
            rs = statement.executeQuery(sql);
            Book book = null;
            while (rs.next()){
                book = new Book();
                book.setBookno(rs.getString("bookno"));
                book.setBookname(rs.getString("bookname"));
                book.setBookprice(rs.getFloat("bookprice"));
                book.setBooknumber(rs.getInt("booknumber"));
                bookHashMap.put(book.getBookno(), book);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return bookHashMap;
    }

    // 关闭数据库资源

    public void close(Connection ct) {
        // 关闭资源
        try {
            if (ct != null) {
                ct.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
