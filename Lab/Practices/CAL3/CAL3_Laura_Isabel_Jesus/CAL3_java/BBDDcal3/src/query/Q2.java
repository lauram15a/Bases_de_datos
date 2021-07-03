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
public class Q2 {
    
        //\"member\"

    public static String q2(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT DISTINCT \"name\", \"type\"\n" +
"FROM worker;");
            
            int i = 0;
            
            while (rs.next()){
                resultado = resultado + "\n" + String.valueOf(i) + "- " + rs.getString("name") + " | " + rs.getString("type");
                
                i++;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        return resultado;
    }
}
