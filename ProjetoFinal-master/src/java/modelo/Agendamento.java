package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import util.BancoDados;
import java.sql.Date;
import java.sql.Timestamp;

public class Agendamento {

    private long id;
    private long idservico;
    private Time horainicio;
    private Time horafim;
    private double preco;
    private Timestamp datacadastro;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getIdservico() {
        return idservico;
    }

    public void setIdservico(long idservico) {
        this.idservico = idservico;
    }

    public Time getHorainicio() {
        return horainicio;
    }

    public void setHorainicio(Time horainicio) {
        this.horainicio = horainicio;
    }

    public Time getHorafim() {
        return horafim;
    }

    public void setHorafim(Time horafim) {
        this.horafim = horafim;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public Timestamp getDatacadastro() {
        return datacadastro;
    }

    public void setDatacadastro(Timestamp datacadastro) {
        this.datacadastro = datacadastro;
    }

    

    

    public long Cadastrar() {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "INSERT INTO tb_agenda ";
            sql += "(horafim, horainicio, preco)";
            sql += " VALUES (?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setTime(1, this.getHorainicio());
            ps.setTime(2, this.getHorainicio());
            ps.setDouble(3, this.getPreco());

            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                final ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    final long lastId = rs.getLong(1);

                    this.setId(lastId);
                    System.out.println(
                            "O id do cliente é:" + lastId);

                    return lastId;
                } else {
                    return 0;
                }
            } else {
                return 0;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public List<Agendamento> ListarTodos() {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM tb_agenda; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Agendamento> lista = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Agendamento agenda = new Agendamento();

                agenda.setId(rs.getLong("id"));
                agenda.setHorainicio(rs.getTime("horainicio"));
                agenda.setHorafim(rs.getTime("horafim"));
                agenda.setPreco(rs.getDouble("preco"));
                agenda.setIdservico(rs.getLong("idservico"));
                agenda.setDatacadastro(rs.getTimestamp("datacadastro"));
                
                

                lista.add(agenda);
            }
            return lista;

        } catch (SQLException e) {

            System.out.println(e.getMessage());
            return null;
        }
    }

    public boolean BuscarPorId(String id) {

        try {

            long idpro = Long.parseLong(id);

            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM tb_agenda WHERE id = ? ; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, idpro);
            final ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                this.setId(rs.getLong("id"));
                this.setHorainicio(rs.getTime("horainicio"));
                this.setHorafim(rs.getTime("horafim"));
                this.setPreco(rs.getDouble("preco"));
                this.setIdservico(rs.getLong("idservico"));
                this.setDatacadastro(rs.getTimestamp("datacadastro"));
                
               

                return true;
            } else {
                return false;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean Atualizar() {
        try {
            Connection conn = BancoDados.getConexao(); //conectar com o bando de dados e enviar os dados salvos da classe Contato.
            String sql = "UPDATE tb_agenda "
                    + " SET horainicio = ?, "
                    + " horafim = ?, "               
                    + " preco = ? "
                    + " WHERE id = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setTime(1, this.getHorainicio());
            ps.setTime(2, this.getHorafim());
            ps.setDouble(3, this.getPreco());
           
            ps.setLong(4, this.getId());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                System.out.println("atualizou!");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }

    public boolean Excluir() {
        try {
            Connection conn = BancoDados.getConexao(); //conectar com o bando de dados e enviar os dados salvos da classe Contato.
            String sql = "DELETE FROM tb_agenda WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, this.getId());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                System.out.println("Apagou!!");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }

}
