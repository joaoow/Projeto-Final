/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sala305b
 */
public class BancoDados {

    public static Connection getConexao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); //conectar com o banco de dados
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/"
                    + "bdacademia"
                    + "?useTimezone=true"
                    + "&serverTimezone=America/Sao_Paulo"
                    + "&autoReconnect=true&useSSL=false",
                    "root", "123456");
            return conn;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
}