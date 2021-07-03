/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package query;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author laura
 */
public class Q20 {

    // 20. Perform the same query as the previous point but for those tickets in which no discount coupons have been used
    
     public static String q20(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT DISTINCT worker.\"name\", ticket.\"ID\"\n" +
"FROM worker INNER JOIN \"ticket\"\n" +
"ON worker.\"ID\" = \"ticket\".\"ID_cashier\"\n" +
"INNER JOIN \"supermarket\"\n" +
"ON supermarket.city = worker.city_supermarket\n" +
"WHERE supermarket.city = 'Alcalá de Henares' and ticket.coupon_used = FALSE;");
                        
            int i = 0;
            
            while (rs.next()){
                resultado = resultado + "\n" + i + "- Cashier name: " + rs.getString(1) + "  |  ID ticket: " + rs.getString(2);
                i++;
            }
            
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        return resultado;
    }
 }


