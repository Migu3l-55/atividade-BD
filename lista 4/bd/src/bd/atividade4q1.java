package bd;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import dao.AlunoDAO;
import java.sql.*;
import dto.alunoDTO;

public class atividade4q1 {

    public static void main(String [] args) {
        Scanner scanner =  new Scanner(System.in);
        char escolha;
        do {
            alunoDTO aluno = new alunoDTO();
            Scanner string = new Scanner(System.in); 

            System.out.print("Número aluno --> ");
            aluno.setNumero(scanner.nextInt());
            
            System.out.print("Nome aluno --> ");
            aluno.setNome(string.nextLine());

            System.out.print("Curso --> ");
            aluno.setCurso(string.nextLine());

            System.out.print("1° nota -->");
            aluno.setNota1(scanner.nextDouble());

            System.out.print("2° nota -->");
            aluno.setNota2(scanner.nextDouble());

            System.out.print("3° nota -->");
            aluno.setNota3(scanner.nextDouble());
            
            System.out.print("4° nota -->");
            aluno.setNota4(scanner.nextDouble());


            AlunoDAO alunodao = new AlunoDAO();
            alunodao.inserir(aluno);
            
            List<alunoDTO> listaAlunos = new ArrayList<>();
            listaAlunos = alunodao.listarTodos();
            for(int i = 0; i< listaAlunos.size(); i++) {
            	System.out.println(listaAlunos.get(i));
            }

            System.out.print("Deseja adicionar mais um aluno? \n [ s - Sim | n - Não ]\n---> ");
            escolha = scanner.next().charAt(0);
                    } while (escolha != 'n');
        scanner.close();
        
        
    }
}