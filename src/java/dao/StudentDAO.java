/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Student;

/**
 *
 * @author user
 */
public class StudentDAO extends DBContext {

    public StudentDAO() {
    }

    public ArrayList<Student> getStudentList() {
        ArrayList<Student> students = new ArrayList<>();

        String sql = "select * FROM dbo.Students ORDER BY id DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student st = new Student();
                st.setId(rs.getInt("id"));
                st.setName(rs.getString("name"));
                st.setEmail(rs.getString("email"));
                st.setPassword(rs.getString("password"));
                st.setPhone(rs.getString("phone"));
                st.setAddress(rs.getString("address"));
                st.setGender(rs.getBoolean("gender"));
                st.setCreated_at(rs.getString("created_at"));
                students.add(st);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return students;
    }

    public ArrayList<Student> getStudents(String keyword) {
        ArrayList<Student> students = new ArrayList<>();

        String sql = "SELECT * FROM dbo.Students WHERE name LIKE ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    boolean gender = rs.getBoolean("gender");
                    String created_at = rs.getString("created_at");
                    Student s = new Student(id, name, password, email, phone, address, gender, created_at);
                    students.add(s);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return students;
    }

    public Student loginStudent(String Email, String Password) {
        Student student = null;

        String sql = "SELECT * FROM dbo.Students WHERE email = ? AND password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, Email);
            ps.setString(2, Password);
            ResultSet rs = ps.executeQuery();
            if (rs != null & rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                boolean gender = rs.getBoolean("gender");
                String created_at = rs.getString("created_at");
                student = new Student(id, name, password, email, phone, address, gender, created_at);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return student;
    }
    
    public Student checkStudent(String Email) {
        Student student = null;

        String sql = "SELECT * FROM dbo.Students WHERE email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, Email);
            ResultSet rs = ps.executeQuery();
            if (rs != null & rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                boolean gender = rs.getBoolean("gender");
                String created_at = rs.getString("created_at");
                student = new Student(id, name, password, email, phone, address, gender, created_at);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return student;
    }

    public boolean insertStudent(String name, String email, String password, String phone, String address, boolean gender) {
        String sql = "INSERT INTO dbo.Students (name,email,password,phone,address,gender)\n"
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setBoolean(6, gender);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteStudent(String email) {
        String sql = "DELETE FROM dbo.Students WHERE email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        StudentDAO sdao = new StudentDAO();
        ArrayList<Student> s = sdao.getStudents("st");
        for (Student student : s) {
            System.out.println(student);
        }
    }
}
