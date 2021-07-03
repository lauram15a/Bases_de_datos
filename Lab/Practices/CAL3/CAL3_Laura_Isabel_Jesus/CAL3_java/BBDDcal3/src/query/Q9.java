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
public class Q9 {

    // 9. Determine the number of workers each supermarket has, ordering the exit from lowest to highest.
    
    public static String q9(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT \"city_supermarket\", \"district_supermarket\", count(\"worker\") as n_workers\n" +
"FROM \"worker\" \n" +
"GROUP BY \"city_supermarket\", \"district_supermarket\"\n" +
"ORDER BY count(\"worker\") asc;");
            
            int i = 1;
            
            while (rs.next()){
                
                resultado = resultado + "\n" + i + "- " + "City: " + rs.getString("city_supermarket") + "  |  District: " + rs.getString("district_supermarket") + "  |  Number of workers: " + rs.getString("n_workers");
                                
                i++;
            }
            
        } catch (Exception e) {
            System.out.println(e.toString());
            
        }
        
        return resultado;
    }
    
}
