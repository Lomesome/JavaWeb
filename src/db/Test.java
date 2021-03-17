package db;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Test {
    public static void main(String[] args) throws SQLException {
        SqlHelper sqlHelper = new SqlHelper();
        String sql = "select * from user limit 10";
        ResultSet resultSet = sqlHelper.queryExecute(sql);
            while (resultSet.next()){
                System.out.println(resultSet.getString(2));
            }
    }
}
