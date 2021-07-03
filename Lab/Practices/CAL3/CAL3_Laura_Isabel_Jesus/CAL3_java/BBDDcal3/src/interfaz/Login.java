/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaz;

import interfaz.Admin;
import javax.swing.JOptionPane;

/**
 *
 * @author jesus
 */
public class Login extends javax.swing.JFrame {

    /**
     * Creates new form NewJFrame
     */
    public Login() {
        initComponents();
        this.setTitle("Login");
        this.setLocationRelativeTo(null);
        this.setResizable(false);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        usuarioTextField = new javax.swing.JTextField();
        contraTextField = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        logBotton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        usuarioTextField.setToolTipText("");
        usuarioTextField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                usuarioTextFieldActionPerformed(evt);
            }
        });

        contraTextField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                contraTextFieldActionPerformed(evt);
            }
        });

        jLabel1.setText("Introduzca su usuario:");

        jLabel2.setText("Introduzca su contraseña:");

        logBotton.setText("Log in");
        logBotton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                logBottonMouseClicked(evt);
            }
        });
        logBotton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                logBottonActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(29, 29, 29)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2)
                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                .addComponent(contraTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 326, Short.MAX_VALUE)
                                .addComponent(usuarioTextField))
                            .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 148, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(133, 133, 133)
                        .addComponent(logBotton, javax.swing.GroupLayout.PREFERRED_SIZE, 114, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(45, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(52, 52, 52)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(usuarioTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(21, 21, 21)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(contraTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(logBotton, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(37, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void usuarioTextFieldActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_usuarioTextFieldActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_usuarioTextFieldActionPerformed

    private void contraTextFieldActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_contraTextFieldActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_contraTextFieldActionPerformed

    private void logBottonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_logBottonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_logBottonActionPerformed

    private void logBottonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_logBottonMouseClicked
        // TODO add your handling code here:
        String usuario = usuarioTextField.getText();
        String contra = contraTextField.getText();
        
        if ("Admin".equals(usuario)){
            if ("Admin".equals(contra)){
                Admin ad = new Admin(usuario, contra);
                ad.setVisible(true);
                dispose();
            } else {
                JOptionPane.showMessageDialog(this, "Failed password");
            }
        } else if ("Istrator".equals(usuario)){
            if ("Istrator".equals(contra)){
                Admin ad = new Admin(usuario, contra);
                ad.setVisible(true);
                dispose();
            } else {
                JOptionPane.showMessageDialog(this, "Failed password");
            }
        } else if ("Manuel".equals(usuario)){
            if ("Manuel".equals(contra)){
                Manager man = new Manager(usuario, contra);
                man.setVisible(true);
                dispose();
            } else {
                JOptionPane.showMessageDialog(this, "Failed password");
            }
        } else if ("Mariano".equals(usuario)){
            if ("Mariano".equals(contra)){
                Manager man = new Manager(usuario, contra);
                man.setVisible(true);
                dispose();
            } else {
                JOptionPane.showMessageDialog(this, "Failed password");
            }
        } else if ("Carmen".equals(usuario)){
            if ("Carmen".equals(contra)){
                Cashier cas = new Cashier(usuario, contra);
                cas.setVisible(true);
                dispose();
            } else {
                JOptionPane.showMessageDialog(this, "Failed password");
            }
        } else if ("Bernardo".equals(usuario)){
            if ("Bernardo".equals(contra)){
                Cashier cas = new Cashier(usuario, contra);
                cas.setVisible(true);
                dispose();
            } else {
                JOptionPane.showMessageDialog(this, "Failed password");
            }
        } else if ("Hugo Boss".equals(usuario)){
            if ("HugoBoss".equals(contra)){
                HHRR_Manager hhrr = new HHRR_Manager(usuario, contra);
                hhrr.setVisible(true);
                dispose();
            } else {
                JOptionPane.showMessageDialog(this, "Failed password");
            }
        } else if ("Jefe".equals(usuario)){
            if ("Jefe".equals(contra)){
                HHRR_Manager hhrr = new HHRR_Manager(usuario, contra);
                hhrr.setVisible(true);
                dispose();
            } else {
                JOptionPane.showMessageDialog(this, "Failed password");
            }
        } else {
            JOptionPane.showMessageDialog(this, "Failed user");
        }
    }//GEN-LAST:event_logBottonMouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Login().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTextField contraTextField;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JButton logBotton;
    private javax.swing.JTextField usuarioTextField;
    // End of variables declaration//GEN-END:variables
}