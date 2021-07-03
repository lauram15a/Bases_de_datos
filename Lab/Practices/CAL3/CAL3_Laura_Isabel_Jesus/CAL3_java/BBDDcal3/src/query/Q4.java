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
public class Q4 {
    // Query 4. Obtain the total money billed by the supermarket since the implementation of the database. 

    public static String q4(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT SUM (\"totalPrice\") as total_billed\n" +
"FROM ticket;");
            while (rs.next()){
                resultado = resultado + "Total billed: " + rs.getString("total_billed");                
                
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return resultado;

    }
}


