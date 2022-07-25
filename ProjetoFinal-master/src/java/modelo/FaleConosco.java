/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import util.BancoDados;

/**
 *
 * @author sala305b
 */
public class FaleConosco {

    /**
     * @return the datacadastro
     */
    public Timestamp getDatacadastro() {
        return datacadastro;
    }

    /**
     * @param datacadastro the datacadastro to set
     */
    public void setDatacadastro(Timestamp datacadastro) {
        this.datacadastro = datacadastro;
    }

    /**
     * @return the id
     */
    public long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the telefone
     */
    public String getTelefone() {
        return telefone;
    }

    /**
     * @param telefone the telefone to set
     */
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    /**
     * @return the ddd
     */
    public String getDdd() {
        return ddd;
    }

    /**
     * @param ddd the ddd to set
     */
    public void setDdd(String ddd) {
        this.ddd = ddd;
    }

    /**
     * @return the uf
     */
    public String getUf() {
        return uf;
    }

    /**
     * @param uf the uf to set
     */
    public void setUf(String uf) {
        this.uf = uf;
    }

    /**
     * @return the cidade
     */
    public String getCidade() {
        return cidade;
    }

    /**
     * @param cidade the cidade to set
     */
    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }


    private long id;
    private String nome;
    private String email;
    private String telefone;
    private String ddd;
    private String uf;
    private String cidade;
    private String descricao;
    private Timestamp datacadastro;

    public long Cadastrar() {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "INSERT INTO tb_faleconosco";
            sql += "(nome, email, ddd,"
                    + "telefone, uf, cidade,"
                    + "descricao)";
            sql += " VALUES (?,?,?,?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
           ps.setString(1, this.getNome());
            ps.setString(2, this.getEmail());           
            ps.setString(3, this.getDdd());
            ps.setString(4, this.getTelefone());
            ps.setString(5, this.getUf());
            ps.setString(6, this.getCidade());
            ps.setString(7, this.getDescricao());

            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                final ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    final long lastId = rs.getLong(1);

                    this.setId(lastId);
                    System.out.println(
                            "O id do Fale Conosco é:" + lastId);

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

    public List<FaleConosco> ListarTodos() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM bdacademia.tb_faleconosco;";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<FaleConosco> lista = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                FaleConosco fc = new FaleConosco();
                fc.setId(rs.getLong("id"));
                fc.setNome(rs.getString("nome"));
                fc.setEmail(rs.getString("email"));
                fc.setDdd(rs.getString("ddd"));
                fc.setTelefone(rs.getString("telefone"));
                fc.setUf(rs.getString("uf"));
                fc.setCidade(rs.getString("cidade"));
                fc.setDescricao(rs.getString("descricao"));
                fc.setDatacadastro(rs.getTimestamp("dtcadastro"));
                lista.add(fc);
            }
            return lista;

        } catch (SQLException e) {

            System.out.println(e.getMessage());
            return null;
        }
    }

    public boolean BuscarPorId(String id) {

        try {

            long idfalec = Long.parseLong(id);

            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM bdacademia.tb_faleconosco WHERE id = ? ; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, idfalec);
            final ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                this.setId(rs.getLong("id"));
                this.setNome(rs.getString("nome"));
                this.setEmail(rs.getString("email"));
                this.setDdd(rs.getString("ddd"));
                this.setTelefone(rs.getString("telefone"));
                this.setUf(rs.getString("uf"));
                this.setCidade(rs.getString("cidade"));
                this.setDescricao(rs.getString("descricao"));
                this.setDatacadastro(rs.getTimestamp("dtcadastro"));
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
            String sql = "UPDATE bdacademia.tb_faleconosco "
                    + " SET nome = ?, "
                    + " email = ?, "
                    + " ddd = ?, "
                    + " telefone = ?, "
                    + " uf = ?, "
                    + " cidade = ?, "
                    + " descricao = ? "
                    + " WHERE id = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getNome());
            ps.setString(2, this.getEmail());           
            ps.setString(3, this.getDdd());
            ps.setString(4, this.getTelefone());
            ps.setString(5, this.getUf());
            ps.setString(6, this.getCidade());
            ps.setString(7, this.getDescricao());
            ps.setLong(8, this.getId());
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
            String sql = "DELETE FROM bdacademia.tb_faleconosco WHERE id = ?; ";
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
