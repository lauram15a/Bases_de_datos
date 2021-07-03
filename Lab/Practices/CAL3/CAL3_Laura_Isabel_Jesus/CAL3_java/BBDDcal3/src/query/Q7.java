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
public class Q7 {

     // 7. Determine the average degree of satisfaction of the opinions that customers have made online, showing the average score.
    
    public static String q7(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT round(avg(score), 2) as m_score\n FROM opinion ;");
            
            while (rs.next()){
                
                resultado = resultado + "\n" + "Average Score: " + rs.getString(1);
            }   
        } catch (Exception e) {
            System.out.println(e.toString());  
        }
        
        return resultado;
    }   
}

