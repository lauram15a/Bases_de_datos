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
public class Q6 {
    
    // 6- Show 5 products on which members have discount coupons 
    
    public static String q6(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3?myCurrentSchema=public", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT DISTINCT product.name_product, muchos_member_tiene_muchos_coupon.\"membershipCode_member\"\n" +
"FROM coupon INNER JOIN muchos_member_tiene_muchos_coupon ON \"ID\" = \"ID_coupon\",\n" +
"muchos_coupon_tiene_muchos_product INNER JOIN product ON \"barCode_product\" = \"barCode\" \n" +
"LIMIT 5 ; ");
            
            int i = 1;
            
            while (rs.next()){
                resultado = resultado + "\n" + i + "- " + "Member Code: " + rs.getString("muchos_member_tiene_muchos_coupon.\"membershipCode_member\"") + "  |  Product: " + rs.getString("product.name_product");
                       
                i++;
                
             }
            
        } catch (Exception e) {
            System.out.println(e.toString());
            
        }
        
        return resultado;
    }

}
