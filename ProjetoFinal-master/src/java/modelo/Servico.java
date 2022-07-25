package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import util.BancoDados;

public class Servico {

    /**
     * @return the vagas
     */
    public int getVagas() {
        return vagas;
    }

    /**
     * @param vagas the vagas to set
     */
    public void setVagas(int vagas) {
        this.vagas = vagas;
    }

    private long id;
    private double preco;
    private String modalidade;
    private String descricao;
    private Usuario resp;
    private int vagas;

    /**
     * @return the resp
     */
    public Usuario getResp() {
        return resp;
    }

    /**
     * @param resp the resp to set
     */
    public void setResp(Usuario resp) {
        this.resp = resp;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public String getModalidade() {
        return modalidade;
    }

    public void setModalidade(String modalidade) {
        this.modalidade = modalidade;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public long Cadastrar() {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "INSERT INTO tb_cadservico";
            sql += "(preco, modalidade, descricao, vagas)";
            sql += " VALUES (?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setDouble(1, this.getPreco());
            ps.setString(2, this.getModalidade());
            ps.setString(3, this.getDescricao());
            ps.setInt(4, this.getVagas());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                final ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    final long lastId = rs.getLong(1);

                    this.setId(lastId);
                    System.out.println(
                            "O id do serviço é:" + lastId);

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

    public List<Servico> ListarTodos() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM bdacademia.tb_cadservico;" ;
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Servico> lista = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Servico s = new Servico();
                s.setId(rs.getLong("id"));
                s.setPreco(rs.getDouble("preco"));
                s.setModalidade(rs.getString("modalidade"));
                s.setDescricao(rs.getString("descricao"));
                s.setVagas(rs.getInt("vagas"));
                lista.add(s);
            }
            return lista;

        } catch (SQLException e) {

            System.out.println(e.getMessage());
            return null;
        }
    }

    public boolean BuscarPorId(String id) {

        try {

            long idserv = Long.parseLong(id);

            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM bdacademia.tb_cadservico WHERE id = ? ; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, idserv);
            final ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                this.setId(rs.getLong("id"));
                this.setPreco(rs.getDouble("preco"));
                this.setModalidade(rs.getString("modalidade"));
                this.setDescricao(rs.getString("descricao"));
                this.setVagas(rs.getInt("vagas"));

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
            String sql = "UPDATE bdacademia.tb_cadservico "
                    + " SET preco = ?, "
                    + " modalidade = ?, "
                    + " descricao = ?, "
                    + " vagas = ? "
                    + " WHERE id = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setDouble(1, this.getPreco());
            ps.setString(2, this.getModalidade());
            ps.setString(3, this.getDescricao());
            ps.setInt(4, this.getVagas());
            ps.setLong(5, this.getId());
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
            String sql = "DELETE FROM bdacademia.tb_cadservico WHERE id = ?; ";
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
