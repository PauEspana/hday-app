package app;

import java.sql.*;
import java.io.*;
import java.util.*;

public class Quiz {

    static final String DATABASE_STRING = "jdbc:mysql://172.16.242.59:3306";
    static final String DATABASE_USER = "root";
    static final String DATABASE_PASSWORD = "winintin123456789";

    static Connection con;

    public static void main(String[] args) throws SQLException {
        db();
        play();
    }

    private static void db() {
        try (
             Connection con = DriverManager.getConnection(DATABASE_STRING + "/quiz", DATABASE_USER, DATABASE_PASSWORD);
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT initialized FROM initializeDatabase")
        ) {
            if (rs.next() && rs.getInt("initialized") == 1) {
                return;
            }
        } catch (SQLException e) {
            System.out.println("DATABASE NOT INITIALIZED, INITIALIZING...");
        }

        try {
            con = DriverManager.getConnection(DATABASE_STRING, DATABASE_USER, DATABASE_PASSWORD);
            Statement stmt = con.createStatement();

            stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS quiz");
            stmt.executeUpdate("USE quiz");

            stmt.close();

            Statement tableStmt = Quiz.con.createStatement();
            tableStmt.executeUpdate("CREATE TABLE IF NOT EXISTS initializeDatabase (" +
                    "id INT PRIMARY KEY AUTO_INCREMENT, " +
                    "initialized INT NOT NULL)");

            ResultSet rs = tableStmt.executeQuery("SELECT COUNT(*) FROM initializeDatabase");
            rs.next();
            int rowCount = rs.getInt(1);

            if (rowCount == 0) {
                tableStmt.executeUpdate("INSERT INTO initializeDatabase (initialized) VALUES (0)");
            }

            tableStmt.close();
            initializeDatabase();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void initializeDatabase() {
        String filePath = "init.sql"; // Path to your SQL file

        try {
            Statement stmt = con.createStatement();
            Scanner scanner = new Scanner(new File(filePath));
            scanner.useDelimiter(";"); // Separate SQL statements using ';'

            while (scanner.hasNext()) {
                String sql = scanner.next().trim();
                if (!sql.isEmpty()) {
                    stmt.executeUpdate(sql);
                }
            }

            scanner.close();
            stmt.close();
            System.out.println("Database initialized from " + filePath);
        } catch (FileNotFoundException e) {
            System.err.println("SQL file not found: " + filePath);
        } catch (SQLException e) {
            System.err.println("SQL error: " + e.getMessage());
        }
    }

    public static void play() {
        Scanner sc = new Scanner(System.in);
        boolean played = false;

        System.out.println("Introdueix el teu nom ");
        String username = sc.nextLine().trim();

        System.out.print(
                """
                         _                _    _                   _              
                        | |              | |  (_)                 | |                                    
                        | |__   __ _  ___| | ___ _ __   __ _    __| | __ _ _   _
                        | '_ \\ / _` |/ __| |/ / | '_ \\ / _` |  / _` |/ _` | | | |
                        | | | | (_| | (__|   <| | | | | (_| | | (_| | (_| | |_| |
                        |_| |_|\\__,_|\\___|_|\\_\\_|_| |_|\\__, |  \\__,_|\\__,_|\\__, |
                                                        __/ |               __/ |
                                                       |___/               |___/
                        """
        );

        try {
            con = DriverManager.getConnection(DATABASE_STRING + "/quiz", DATABASE_USER, DATABASE_PASSWORD);
            Statement s = con.createStatement();

            ResultSet rs = s.executeQuery("SELECT `option`, value FROM info");
            Map<String, String> options = new HashMap<>();
            while (rs.next()) {
                options.put(rs.getString("option"), rs.getString("value"));
            }

            System.out.printf("%nBenvingut A The server of Isaac %s! %n", username);
            System.out.println(options.get("introduccio"));

            rs = s.executeQuery("SELECT MAX(solved) as last FROM results WHERE username='" + username + "'");
            int start = 0;

            if (rs.next()) {
                start = rs.getInt("last");
            }

            List<Prova> challenges = new ArrayList<>();

            rs = s.executeQuery("SELECT id, question, answer FROM questions WHERE id > " + start + " ORDER BY id");
            while (rs.next()) {

                int questionId = rs.getInt("id");
                String question = rs.getString("question");
                String answer = rs.getString("answer");
                challenges.add(new Prova(questionId, question, answer));
            }

            for (int i = 0; i < challenges.size(); i++) {
                played = true;
                Prova p = challenges.get(i);

                System.out.println("Prova " + p.id + ": " + p.pregunta);
                String answer = sc.nextLine();

                if (answer.equals(p.resposta)) {
                    System.out.println("Resposta correcta");
                    s.executeUpdate("INSERT INTO results (username, solved) VALUES ('" + username + "', " + p.id + ")");
                } else {
                    System.out.println("Resposta incorrecta");
                    i--;
                }
            }

            if (played) {
                System.out.println("Enhorabona, ja has acabat totes les proves!");
                System.out.println();
                System.out.println(options.get("despedida"));
            } else {
                System.out.println("No hi ha cap prova disponible");
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}