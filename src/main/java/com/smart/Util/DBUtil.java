package com.smart.Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 通用的数据操作方法
 */
public class DBUtil {

    private static final String URL  ="jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF-8" ;
    private static final String JDBC_NAME = "com.mysql.jdbc.Driver";
    private static final String USERNAME  ="root" ;
    private static final String PASSWORD  ="admin" ;
    private static PreparedStatement pstmt = null ;
    private static Connection connection = null ;
    private static ResultSet rs = null ;
    static{
        try {
            Class.forName(JDBC_NAME);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


    /**
     * 通用的增删改方法
     * @param sql sql语句
     * @param params 增删改的集合
     * @return 成功与否
     */
    public static boolean executeUpdate(String sql,Object[] params) {
        try {
            //setXxx()方法的个数 依赖于 ?的个数， 而?的个数 又和 数组params的个数一致
            //setXxx()方法的个数 ->数组params的个数一致
            pstmt = createPreParedStatement(sql,params);
            int count = pstmt.executeUpdate() ;
            if(count>0){
                return true ;
                }
            else {
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false ;
        }catch (Exception e) {
            e.printStackTrace();
            return false ;
        }
        finally {
            closeAll(null,pstmt,connection);
        }
    }

    /**
     * 关闭
     * @param rs ResultSet
     * @param stmt Statement
     * @param connection Connection
     */
    private static void closeAll(ResultSet rs, Statement stmt, Connection connection)
    {
        try {
            if (rs!=null) {
                rs.close();
            }

            if(pstmt!=null){
                pstmt.close();
            }
            if(connection!=null){
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


    /**
     * 获得Connection
     * @return Connection
     * @throws SQLException SQLException
     */
    private static Connection getConnection() throws SQLException {
        return  DriverManager.getConnection( URL,USERNAME,PASSWORD ) ;
    }


    /**
     * 将集合按顺序插入PreparedStatement
     * @param sql sql语句
     * @param params 集合
     * @return PreparedStatement
     * @throws SQLException SQLException
     */
    private static PreparedStatement createPreParedStatement(String sql, Object[] params) throws SQLException {
        pstmt = getConnection() .prepareStatement( sql) ;
        if(params!=null ) {
            for(int i=0;i<params.length;i++) {
                pstmt.setObject(i+1, params[i]);
            }
        }
        return pstmt;
    }


    /**
     * 通用的查  :适合任何查询
     * @param sql sql语句
     * @param params  更新的集合
     * @return
     */
    public static ResultSet executeQuery( String sql ,Object[] params)
    {
        try {

            pstmt = createPreParedStatement(sql,params);
            rs =  pstmt.executeQuery() ;
            return rs ;
        } catch (SQLException e) {
            e.printStackTrace();
            return null ;
        }catch (Exception e) {
            e.printStackTrace();
            return null ;
        }
    }

}
