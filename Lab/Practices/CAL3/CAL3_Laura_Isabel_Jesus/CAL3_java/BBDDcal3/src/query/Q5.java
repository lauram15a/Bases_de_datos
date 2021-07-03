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
public class Q5 {
    
    //5. Show customer coupons, along with the products they affect and the discount made
    
    public static String q5(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT coupon.\"ID\", product.name_product, muchos_member_tiene_muchos_coupon.\"membershipCode_member\", coupon.percentage\n" +
"FROM coupon INNER JOIN muchos_member_tiene_muchos_coupon ON \"ID\" = \"ID_coupon\",\n" +
"muchos_coupon_tiene_muchos_product INNER JOIN product ON \"barCode_product\" = \"barCode\"; ");
            
            int i = 1;
            
            while (rs.next()){
                resultado =  resultado + "\n" + i + "- Member Code: " + rs.getString(3) + "  |  ID coupon: " + rs.getString(1) + "  |  Product: " + rs.getString(2) + "  |  Coupon perecentage: " + rs.getString(4);
                i++;
            }
            
        } catch (Exception e) {
            System.out.println(e.toString());
            
        }
        
        return resultado;
    }

}
