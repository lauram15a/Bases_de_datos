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
public class Q16 {

    // 16. Show the name of the cashier that has issued the most tickets

    public static String q16(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT \"name\", count(\"ticket\") \n" +
"FROM \"worker\" INNER JOIN \"ticket\" \n" +
"ON (\"worker\".\"ID\" = \"ticket\".\"ID_cashier\") \n" +
"GROUP BY \"name\" HAVING count(\"ticket\") = (SELECT max(counter)\n" +
"                         	 FROM (SELECT count(\"ID_cashier\") as counter\n" +
"                               	FROM \"ticket\"\n" +
"                                	GROUP BY \"ID_cashier\")as r);");
                        
            while (rs.next()){
                resultado = resultado + "\n" + "Name: " + rs.getString(1) + "   |  Number of tickets returned: " + rs.getString(2);
            }
            
        } catch (Exception e) {
            System.out.println(e.toString());
            
        }
        
        return resultado;
    }
    
}

