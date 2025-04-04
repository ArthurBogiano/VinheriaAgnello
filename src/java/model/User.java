package model;

import dao.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class User {
    private int id;
    private String username;
    private String password;
    private String nome;
    private String dataNascimento;
    private String cpf;
    private String endereco;
    private boolean admin;

    public User() {}

    public boolean save() {
        try (Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement ps = connection.prepareStatement(
                "INSERT INTO users (username, password, nome, data_nascimento, cpf, endereco) VALUES (?, ?, ?, ?, ?, ?)"
            );
            ps.setString(1, this.username);
            ps.setString(2, this.password);
            ps.setString(3, this.nome);
            ps.setString(4, this.dataNascimento);
            ps.setString(5, this.cpf);
            ps.setString(6, this.endereco);

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User authenticate() {
        try (Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement ps = connection.prepareStatement(
                "SELECT * FROM users WHERE username = ? AND password = ?"
            );
            ps.setString(1, this.username);
            ps.setString(2, this.password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User authenticatedUser = new User();
                authenticatedUser.setId(rs.getInt("id"));
                authenticatedUser.setUsername(rs.getString("username"));
                authenticatedUser.setNome(rs.getString("nome"));
                authenticatedUser.setDataNascimento(rs.getString("data_nascimento"));
                authenticatedUser.setCpf(rs.getString("cpf"));
                authenticatedUser.setEndereco(rs.getString("endereco"));
                authenticatedUser.setAdmin(rs.getBoolean("admin"));

                return authenticatedUser;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM users");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setNome(rs.getString("nome"));
                user.setDataNascimento(rs.getString("data_nascimento"));
                user.setCpf(rs.getString("cpf"));
                user.setEndereco(rs.getString("endereco"));
                user.setAdmin(rs.getBoolean("admin"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    
    public static boolean deleteUser(int id) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM users WHERE id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static User getUserById(int id) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM users WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setNome(rs.getString("nome"));
                user.setDataNascimento(rs.getString("data_nascimento"));
                user.setCpf(rs.getString("cpf"));
                user.setEndereco(rs.getString("endereco"));
                user.setAdmin(rs.getBoolean("admin"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean update() {
        try (Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement ps = connection.prepareStatement(
                "UPDATE users SET nome=?, username=?, data_nascimento=?, cpf=?, endereco=?, admin=? WHERE id=?"
            );
            ps.setString(1, this.nome);
            ps.setString(2, this.username);
            ps.setString(3, this.dataNascimento);
            ps.setString(4, this.cpf);
            ps.setString(5, this.endereco);
            ps.setBoolean(6, this.admin);
            ps.setInt(7, this.id);

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // Getters e Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }
    
    public boolean getAdmin() {
        return admin;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(String dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
    
    public void setAdmin(boolean admin) {
        this.admin = admin;
    }
}