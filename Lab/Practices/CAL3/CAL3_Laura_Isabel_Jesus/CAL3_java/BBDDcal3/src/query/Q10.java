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
public class Q10 {

    // 10. Show the name and telephone number of the employee with the best score
    
    public static String q10(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT DISTINCT worker.name, worker.phone, muchos_worker_tiene_muchos_worker.grade\n" +
"FROM worker INNER JOIN muchos_worker_tiene_muchos_worker ON \"ID\" = \"ID_worker\"\n" +
"WHERE grade = (SELECT max(grade)\n" +
"		  FROM \"muchos_worker_tiene_muchos_worker\");");
            
            
            while (rs.next()){
                resultado = resultado + "\n" + rs.getString(1) + "has the best score (" + rs.getString(3) + ")" + "   |  Telephone number: " + rs.getString(2);
            }
            
        } catch (Exception e) {
            System.out.println(e.toString());
            
        }
        
        return resultado;

    }
    
}
