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
public class Q3 {
    
    // Query 3.  Obtain the name of the repleteners who work more than 20 hours per week.

    public static String q3(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT DISTINCT repletener.\"ID\", worker.\"name\", \"numberHours\"\n" +
"FROM repletener INNER JOIN worker ON repletener.\"ID\"=worker.\"ID\"\n" +
"WHERE \"numberHours\">20;");

            int i = 0;
            
            while (rs.next()){   
                resultado = resultado + "\n" + String.valueOf(i) + "- " + rs.getString(2) + " | " + rs.getString(1) + " | " + rs.getString(3);
               
                 i++;
                
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        return resultado;
    }
    
}
