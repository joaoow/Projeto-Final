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

public class Usuario {

    private long id;
    private String responsavel;
    private String login;
    private String senha;
    private String cpf;
    private Date datanascimento;
    private String email;
    private String ddd;
    private String telefone;
    private String admin;
    private Timestamp datacadastro;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getResponsavel() {
        return responsavel;
    }

    public void setResponsavel(String responsavel) {
        this.responsavel = responsavel;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public Date getDatanascimento() {
        return datanascimento;
    }

    public void setDatanascimento(Date datanascimento) {
        this.datanascimento = datanascimento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDdd() {
        return ddd;
    }

    public void setDdd(String ddd) {
        this.ddd = ddd;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    /**
     * @return the admin
     */
    public String getAdmin() {
        return admin;
    }

    /**
     * @param admin the admin to set
     */
    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public Timestamp getDatacadastro() {
        return datacadastro;
    }

    public void setDatacadastro(Timestamp datacadastro) {
        this.datacadastro = datacadastro;
    }

    public boolean TemUsuario() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT id, responsavel, eh_admin, datacadastro "
                    + "FROM tb_usuario "
                    + "WHERE login = ? AND senha = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getLogin());
            ps.setString(2, this.getSenha());
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                this.setId(rs.getLong("id"));
                this.setResponsavel(rs.getString("responsavel"));
                this.setAdmin(rs.getString("eh_admin"));
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

    public long Cadastrar() {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "INSERT INTO tb_usuario ";
            sql += "(responsavel, login, senha,"
                    + "cpf, datanascimento, email, "
                    + "ddd, telefone, eh_admin)";
            sql += " VALUES (?,?,?,?,?,?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, this.getResponsavel());
            ps.setString(2, this.getLogin());
            ps.setString(3, this.getSenha());
            ps.setString(4, this.getCpf());
            ps.setDate(5, this.getDatanascimento());
            ps.setString(6, this.getEmail());
            ps.setString(7, this.getDdd());
            ps.setString(8, this.getTelefone());
            ps.setString(9, this.getAdmin());
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

    public List<Usuario> ListarTodos() {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM tb_usuario; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Usuario> lista = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Usuario c = new Usuario();

                c.setId(rs.getLong("id"));
                c.setResponsavel(rs.getString("responsavel"));
                c.setLogin(rs.getString("login"));
                c.setSenha(rs.getString("senha"));
                c.setCpf(rs.getString("cpf"));
                c.setDatanascimento(rs.getDate("datanascimento"));
                c.setEmail(rs.getString("email"));
                c.setDdd(rs.getString("ddd"));
                c.setTelefone(rs.getString("telefone"));
                c.setAdmin(rs.getString("eh_admin"));
                c.setDatacadastro(rs.getTimestamp("datacadastro"));
                lista.add(c);
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
            String sql = "SELECT * FROM tb_usuario WHERE id = ? ; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, idpro);
            final ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                this.setId(rs.getLong("id"));
                this.setResponsavel(rs.getString("responsavel"));
                this.setLogin(rs.getString("login"));
                this.setSenha(rs.getString("senha"));
                this.setCpf(rs.getString("cpf"));
                this.setDatanascimento(rs.getDate("datanascimento"));
                this.setEmail(rs.getString("email"));
                this.setDdd(rs.getString("ddd"));
                this.setTelefone(rs.getString("telefone"));
                this.setAdmin(rs.getString("eh_admin"));
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
            String sql = "UPDATE tb_usuario "
                    + " SET responsavel = ?, "
                    + " login = ?, "
                    + " senha = ?, "
                    + " cpf  =?, "
                    + " datanascimento = ?, "
                    + " email = ?, "
                    + " ddd = ?, "
                    + " telefone = ? "
                    + " WHERE id = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getResponsavel());
            ps.setString(2, this.getLogin());
            ps.setString(3, this.getSenha());
            ps.setString(4, this.getCpf());
            ps.setDate(5, this.getDatanascimento());
            ps.setString(6, this.getEmail());
            ps.setString(7, this.getDdd());
            ps.setString(8, this.getTelefone());
            ps.setLong(9, this.getId());
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
            String sql = "DELETE FROM tb_usuario WHERE id = ?; ";
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
