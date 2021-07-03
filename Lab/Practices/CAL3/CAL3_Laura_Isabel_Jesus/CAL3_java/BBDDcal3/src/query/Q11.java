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
public class Q11 {

    // 11. Show the barcode and the discount of the products that were on sale the first week of May 2019.
    
    public static String q11(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT product.name_product, product.\"barCode\", discount.percentage\n" +
"FROM product INNER JOIN \"discount\"\n" +
"ON (product.week_discount = \"discount\".week )\n" +
"WHERE product.week_discount = 18;");
            
            int i = 1;
            
            while (rs.next()){
                
                resultado = resultado + "\n" + i + "- " + "Product: " + rs.getString(1) + "  |  Bar Code: " + rs.getString(2) + "  |  Discount: " + rs.getString(3) + "%";
                
                i++;
            }
            
        } catch (Exception e) {
            System.out.println(e.toString());
            
        }
        
        return resultado;
    }
    
}

