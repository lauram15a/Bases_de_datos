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
public class Q13 {

    // 13. Show the name of the workers in alphabetical order of the supermarkets located in cities that begin with “M”. 
    
    public static String q13(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario,contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT DISTINCT \"name\"\n" +
"FROM \"worker\" INNER JOIN supermarket \n" +
"ON \"worker\".city_supermarket = supermarket.city AND supermarket.city LIKE 'M%'\n" +
"ORDER BY \"name\";");
            
            int i = 1;
            
            while (rs.next()){
                
                resultado = resultado + "\n" + i + "- " + "Worker name: " + rs.getString(1);
                
                i++;
            }
            
        } catch (Exception e) {
            System.out.println(e.toString());
            
        }
        
        return resultado;
    }
}
    

