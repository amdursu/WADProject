/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *
 * @author andrei
 */
public class FavoritesDAO {
    private static FavoritesDAO instance;
    
    private FavoritesDAO(){}
    
    public FavoritesDAO getInstance(){
        if(instance == null){
            instance = new FavoritesDAO();
        }
        return instance;
    }
    
    public static boolean favoriteExists(String model, int userID, int drivetrainID) throws SQLException, NamingException{
        Connection c = DBConnection.getConnection();
        String sql = "SELECT c.model, d.power, f.user, f.drivetrain FROM favorites f JOIN drivetrains d ON d.id = f.drivetrain JOIN cars c ON c.id = d.car_id;";
        Statement instr = c.createStatement();
        ResultSet rs = instr.executeQuery(sql);
        while(rs.next()){
            if(rs.getString("model").equals(model) && rs.getInt("user") == userID && rs.getInt("drivetrain") == drivetrainID){
                return true;
            }
        }
        return false;
    }
    
    public static boolean addFavorite(String email, String model, String engine, String transmission, int power) throws NamingException, SQLException{
        Connection c = DBConnection.getConnection();
        
        String sql1 = "SELECT id FROM users WHERE email = '" + email +"';";
        String sql2 = "SELECT d.id FROM drivetrains d JOIN cars c ON c.id = d.car_id WHERE c.model = \"" + model 
                + "\" AND d.engine = \"" + engine + "\" AND d.transmission = \"" + transmission + "\" AND d.power = " + power + ";";
        String sql = "INSERT INTO favorites (user, drivetrain) VALUES (?, ?);";
        
        PreparedStatement instr = c.prepareStatement(sql);
        
        Statement instr1 = c.createStatement();
        ResultSet rs1 = instr1.executeQuery(sql1);
        rs1.next();
        int userID = rs1.getInt("id");
        instr.setInt(1, userID);
        
        Statement instr2 = c.createStatement();
        ResultSet rs2 = instr2.executeQuery(sql2);
        rs2.next();
        int drivetrainID = rs2.getInt("id");
        instr.setInt(2, drivetrainID);
        
        if(!favoriteExists(model, userID, drivetrainID)){
            instr.execute();
            return true;
        }
        return false;
    }
    
    public static ArrayList<Favorite> getUserFavorites(String user) throws NamingException, SQLException{
        ArrayList<Favorite> favorites = new ArrayList<>();
        Connection c = DBConnection.getConnection();
        
        String sql = "SELECT c.manufacturer, c.model, c.img, c.description, d.engine, d.transmission, d.power, d.torque, d.popularity "
                + "FROM favorites f JOIN drivetrains d ON f.drivetrain = d.id JOIN cars c ON d.car_id = c.id "
                + "JOIN users u ON u.id = f.user WHERE u.email = '" + user + "';";
        
        Statement instr = c.createStatement();
        ResultSet rs = instr.executeQuery(sql);
        while(rs.next()){
            Favorite f = new Favorite(new Car(rs.getString("manufacturer"), rs.getString("model"), 
                    rs.getString("img"), rs.getString("description")), new Drivetrain(rs.getString("model"), rs.getString("engine"), 
                    rs.getString("transmission"), rs.getInt("power"), rs.getInt("torque"), rs.getInt("popularity")));
            favorites.add(f);
        }
        
        return favorites;
    }
    
    public static ArrayList<Favorite> getTopFavorites(ArrayList<PopularityItem> top) throws NamingException, SQLException{
        ArrayList<Favorite> topFavorites = new ArrayList<>();
        Connection c = DBConnection.getConnection();
        
        for(PopularityItem p : top){
            String sql = "SELECT c.manufacturer, c.model, c.img, c.description, d.engine, d.transmission, d.engine, d.power, d.torque, d.popularity FROM "
                    + "drivetrains d JOIN cars c ON c.id = d.car_id WHERE d.id = " + p.getDrivetrainID() + ";";
            Statement instr = c.createStatement();
            ResultSet rs = instr.executeQuery(sql);
            while(rs.next()){
                Favorite f = new Favorite(new Car(rs.getString("manufacturer"), rs.getString("model"), rs.getString("img"), rs.getString("description")),
                        new Drivetrain(rs.getString("model"), rs.getString("engine"), rs.getString("transmission"), 
                                        rs.getInt("power"), rs.getInt("torque"), rs.getInt("popularity")));
                topFavorites.add(f);
            }
        }
        
        return topFavorites;
    }
}
