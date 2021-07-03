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
public class Q12 {

    // 12. Show the name of the members who have benefited from discounts applied to a product the last week of May 2019
    
    public static String q12(String usuario, String contra) {
        
        String resultado = "";
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CAL3", usuario, contra);
            Statement st = connection.createStatement();
            System.out.println("Connected:: ");
            
            ResultSet rs;
            rs = st.executeQuery("SELECT member.name, ticket.date, ticket.\"timeIssuance\"\n" +
"FROM member INNER JOIN ticket\n" +
"ON member.\"membershipCode\" = ticket.\"membershipCode_member\"\n" +
"WHERE (ticket.date BETWEEN '27-05-2019' AND '31-05-2019') AND ticket.coupon_used = TRUE;");
            
            int i = 1;
            
            while (rs.next()){
                resultado = resultado + "\n" + i + "- " + "Member: " + rs.getString("member.name") + "  |  Date: " + rs.getString("ticket.date") + "  |  Time: " + rs.getString("ticket.\"timeIssuance\"");
                                
                i++;
            }
            
        } catch (Exception e) {
            System.out.println(e.toString());
            
        }
        
        return resultado;
    }
    
}