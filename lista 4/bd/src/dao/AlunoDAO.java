package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jdbc.ConexaoUtil;
import dto.alunoDTO;

public class AlunoDAO {

	public void inserir(dto.alunoDTO alunoDTO) {
		try {
		Connection connection = ConexaoUtil.getInstance().getConnection();
		
		String sql = "INSERT INTO aluno(numero, nome, curso, nota1, nota2, nota3, nota4) VALUES (?, ?, ?, ?, ?, ?, ?)";
	
		PreparedStatement statement = connection.prepareStatement(sql);
		
		statement.setInt(1 , alunoDTO.getNumero());
		statement.setString(2 , alunoDTO.getNome());
		statement.setString(3 , alunoDTO.getCurso());
		statement.setDouble(4 , alunoDTO.getNota1());
		statement.setDouble(5 , alunoDTO.getNota2());
		statement.setDouble(6 , alunoDTO.getNota3());
		statement.setDouble(7 , alunoDTO.getNota4());
		
		statement.execute();
		connection.close();
		System.out.print("Aluno Inserido com sucesso!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<alunoDTO> listarTodos() {
		List<alunoDTO> listaAlunos = new ArrayList<alunoDTO>();
		try {
			Connection connection = ConexaoUtil.getInstance().getConnection();
			String sql = "SELECT * FROM aluno";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultset = statement.executeQuery();
			while (resultset.next()) {
				alunoDTO alunoDTO = new alunoDTO();
				alunoDTO.setNumero(resultset.getInt("numero"));
				alunoDTO.setNome(resultset.getString("nome"));
				alunoDTO.setCurso(resultset.getString("curso"));
				alunoDTO.setNota1(resultset.getDouble("nota1"));
				alunoDTO.setNota2(resultset.getDouble("nota2"));
				alunoDTO.setNota3(resultset.getDouble("nota3"));
				alunoDTO.setNota4(resultset.getDouble("nota4"));
				
				connection.close();
			}
		} catch (Exception e) {
			e.printStackTrace();;
		}
		return listaAlunos;
	}
	
}
