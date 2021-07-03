
package query;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


/**
 *
 * @author laura
 */
public class q {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/modified5", "postgres", "299792458");
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT DISTINCT product.name_product, muchos_member_tiene_muchos_coupon.\"membershipCode_member\"\n" +
"FROM coupon INNER JOIN muchos_member_tiene_muchos_coupon ON \"ID\" = \"ID_coupon\",\n" +
"muchos_coupon_tiene_muchos_product INNER JOIN product ON \"barCode_product\" = \"barCode\" \n" +
"LIMIT 5");
            while (rs.next()){
                System.out.println(rs.getString("name_product"));
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
    
}
