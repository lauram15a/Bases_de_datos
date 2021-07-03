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
public class Q8 {

    /* 8. Determine the number of tickets that each supermarket has issued, showing the number of tickets, 
    the name of the cashier and the city of the supermarket where the cashier works. Sort the output from highest to lowest.
    */

    
    public static String q8(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT \"name\", \"city_supermarket\", \"district_supermarket\", count(\"ticket\") as n_ticket\n" +
"FROM \"worker\" INNER JOIN \"ticket\" 			\n" +
"ON (\"worker\".\"ID\" = \"ticket\".\"ID_cashier\") \n" +
"GROUP BY \"city_supermarket\", \"district_supermarket\", \"name\"\n" +
"ORDER BY count(\"ticket\") desc;");
            
            int i = 1;
            
            while (rs.next()){
                resultado = resultado + "\n" + i + "- Cashier: " + rs.getString(1) + "  |  Number of tickets: " + rs.getString("n_ticket") + "  |  City: " + rs.getString("city_supermarket") + "  |  District: " + rs.getString("district_supermarket");
                                
                i++;
            }
            
        } catch (Exception e) {
            System.out.println(e.toString());
            
        }
        
        return resultado;
    }
    
}

     


