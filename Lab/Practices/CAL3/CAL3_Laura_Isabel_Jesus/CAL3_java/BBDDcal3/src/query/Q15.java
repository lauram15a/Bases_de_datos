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
public class Q15 {

    // 15. Show the product that has been returned the most times.  

    public static String q15(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT DISTINCT product.name_product, product.\"barCode\"\n" +
"FROM product INNER JOIN returned ON \"barCode\" = \"barCode_product\"\n" +
"WHERE amount = (SELECT max(amount)\n" +
"		     FROM \"returned\");");
                        
            while (rs.next()){
                resultado = resultado + "\n" + "Product: " + rs.getString(1) + "    |   Bar Code: " + rs.getString(2);
            }
            
        } catch (Exception e) {
            System.out.println(e.toString()); 
        }
        
        return resultado;
    }
}
