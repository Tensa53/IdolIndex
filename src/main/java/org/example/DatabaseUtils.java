package org.example;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.Properties;

public class DatabaseUtils {


    public static Connection getConnection() throws SQLException {
        Connection conn = null;

        try(FileInputStream f = new FileInputStream("dbparameters")) {
            Properties properties = new Properties();
            properties.load(f);

            String url = properties.getProperty("url");
            String user = properties.getProperty("user");
            String password = properties.getProperty("password");

            conn = DriverManager.getConnection(url, user, password);

            //System.out.println("Connessione al database " + conn.getCatalog() + " avvenuta con successo");
        } catch(IOException e) {
            System.out.println(e.getMessage());
        }

        return conn;
    }

    public static void elencaShow() {
        String sql = "SELECT * FROM MUSICSHOW;";

        try(Connection conn = getConnection(); java.sql.Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)){
            while(rs.next()) {
                System.out.println("Nome :  " + rs.getString("Nome") + "; Via : " + rs.getString("Via") + "; Civico : " + rs.getString("Civico") + "; CAP : " + rs.getString("CAP") + "; Giorno : " + rs.getString("Giorno") + "; OraInizio : " + rs.getString("OraInizio") + "\n");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public static int cercaShow(String nome) {
        String sql = "SELECT * FROM MUSICSHOW WHERE Nome = '" + nome + "'";

        try(Connection conn = getConnection(); java.sql.Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)){
            while(rs.next()) {
                System.out.println("Nome : " + rs.getString("Nome") + "\n" + "Via : " + rs.getString("Via") + "\n" + "Civico : " + rs.getString("Civico") + "\n" + "CAP : " + rs.getString("CAP") + "\n" + "Giorno : " + rs.getString("Giorno") + "\n" + "OraInizio : " + rs.getString("OraInizio"));
                return rs.getRow();
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }

        return 0;
    }

    public static int inserisciShow(String nome,String via,String civico,String cap,String giorno,Time t) {
        String sql = "INSERT INTO MUSICSHOW VALUES(?,?,?,?,?,?)";

        try(Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1, nome);
            pstmt.setString(2, via);
            pstmt.setString(3, civico);
            pstmt.setString(4, cap);
            pstmt.setString(5, giorno);
            pstmt.setTime(6, t);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public static int modficaShow(String nome,String attributo,String valore) {
        String sql = "UPDATE MUSICSHOW SET " + attributo + " = ?" + " WHERE Nome = ?";

        try(Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,valore);
            pstmt.setString(2, nome);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public static int eliminaShow(String nome) {
        String sql = "DELETE FROM MUSICSHOW WHERE Nome = ?";

        try(Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1, nome);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public static void executeQuery1() {
        String sql = "SELECT Nome,Giorno,Orainizio FROM MUSICSHOW M WHERE (M.Nome LIKE 'M%' AND M.Giorno = 'Domenica') OR M.Nome LIKE 'T%' ORDER BY M.OraInizio DESC";

        System.out.println("Eseguita la seguente query : "+sql + "\n");

        try(Connection conn = getConnection(); java.sql.Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)){
            while(rs.next()) {
                System.out.println("Nome :  " + rs.getString("Nome") + "; Giorno : " + rs.getString("Giorno") + "; OraInizio : " + rs.getString("OraInizio") + "\n");
            }
        }catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}