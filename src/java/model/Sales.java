package model;

import dao.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Sales {
    private int id;
    private int userId;
    private int productId;
    private int quantity;
    private double totalPrice;

    public Sales() {}

    public boolean save() {
        try (Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement ps = connection.prepareStatement(
                "INSERT INTO sales (user_id, product_id, quantity, total_price) VALUES (?, ?, ?, ?)"
            );
            ps.setInt(1, this.userId);
            ps.setInt(2, this.productId);
            ps.setInt(3, this.quantity);
            ps.setDouble(4, this.totalPrice);

            ps.executeUpdate();

            // Decrementar o estoque
            Products product = Products.getProductById(this.productId);
            product.setStock(product.getStock() - this.quantity);
            product.update();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static List<Sales> getAllSales() {
        List<Sales> sales = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM sales");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Sales sale = new Sales();
                sale.setId(rs.getInt("id"));
                sale.setUserId(rs.getInt("user_id"));
                sale.setProductId(rs.getInt("product_id"));
                sale.setQuantity(rs.getInt("quantity"));
                sale.setTotalPrice(rs.getDouble("total_price"));
                sales.add(sale);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sales;
    }

    // Getters e Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }
}