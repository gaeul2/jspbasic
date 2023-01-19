package Model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
    
    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    
    //DB 커넥션 풀을 사용하도록 설정하는 메서드
    public void getCon(){
        try{
            //외부에서 데이터를 읽어들이므로 context를 사용
            Context initctx = new InitialContext();
    
            //톰켓서버에 정보를 담아놓은 곳으로 이동 - java.xml에 있는 환경설정 가져오도록...?
            Context envctx = (Context) initctx.lookup("java:comp/env");
            
            //lookup에 name을 context.xml에 지정한 name과 같이 맞춰줌
            DataSource ds = (DataSource) envctx.lookup("jdbc/BoardPool");

            con = ds.getConnection();
            
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    //하나의 게시글이 넘어와서 저장되는 메서드
    public void insertBoard(BoardBean boardbean) {
        getCon();
        //Bean클래스에 넘어오지 않았던 데이터들 초기화
        int ref = 0; // 글그룹을 의미 -> 쿼리를 실행시켜 가장큰 ref값을 가져온 후 +1을 터대후졈됨
        int re_step = 1; // 새글=부모글
        int re_level = 1;

        try{
            //가장 큰 ref 값을 읽어오는 쿼리 준비
            String refsql = "SELECT max(ref) FROM board";
            //쿼리 실행 객체
            pstmt = con.prepareStatement(refsql);
            //쿼리실행 후 결과를 리턴
            rs = pstmt.executeQuery();
            if(rs.next()){ // 최대값에 +1을 더해서 글그룹 설정
                ref = rs.getInt(1) + 1;
            }
            
            //실제로 게시글 전체값을 테이블에 저장
            /*시퀀스 사용은 시퀀스이름.NEXTVAL로 사용, sysdate는 현재 시스템에 저장된 날짜,시간값
            
             */
            String savesql = "INSERT INTO board VALUES(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
            pstmt = con.prepareStatement(savesql);
            
            //?에 값을 맵핑
            pstmt.setString(1, boardbean.getWriter());
            pstmt.setString(2, boardbean.getEmail());
            pstmt.setString(3, boardbean.getSubject());
            pstmt.setString(4, boardbean.getPassword());
            pstmt.setInt(5, ref);//얘네는 앞에서 초기화한 친구 쓰면 됨.
            pstmt.setInt(6, re_step);
            pstmt.setInt(7, re_level);
            pstmt.setString(8, boardbean.getContent());
    
            pstmt.executeUpdate();
            
            con.close();

        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public ArrayList<BoardBean> getAllBoard() {
        //리턴할 객체 생성
        ArrayList<BoardBean> alist = new ArrayList<>();
        
        getCon();
        
        try{
            // 글정렬하면서 들고와야 하므로
            String selectAllSql = "SELECT * FROM board ORDER BY ref desc , re_step asc";
            pstmt = con.prepareStatement(selectAllSql);//db연결에 sql 적용 대기
            rs = pstmt.executeQuery();
            
            //데이터개수를 모르므로 반복문으로!
            while (rs.next()){
                //데이터를 패키징 (가방 = Boardbean클래스 이용)
                BoardBean bean = new BoardBean(); // 가방만들기
                
                //가방에 차곡차곡 담기
                bean.setNum(rs.getInt(1)); // 가방에 rs의 1번인덱스를 num 으로 넣어줌
                bean.setWriter(rs.getString(2));
                bean.setEmail(rs.getString(3));
                bean.setSubject(rs.getString(4));
                bean.setPassword(rs.getString(5));
                //Date로 받아와서 toString으로 문자열 변환
                bean.setReg_date(rs.getDate(6).toString());
                bean.setRef(rs.getInt(7));
                bean.setRe_step(rs.getInt(8));
                bean.setRe_level(rs.getInt(9));
                bean.setReadcount(rs.getInt(10));
                bean.setContent(rs.getString(11));
                
                //가방에 넣은(패키징한) 데이터를 박스(arrayList)에 저장
                alist.add(bean);
            }
            con.close();
            
        } catch (Exception e){
            e.printStackTrace();
        }
        return alist;
    }
    
    public BoardBean getOneBoard(int num) {
        BoardBean bean = new BoardBean();
        
        getCon();
        try{
            //조회수 증가쿼리
            String hitPlusSql = "UPDATE board SET readcount = readcount + 1 WHERE num = ?";
            pstmt = con.prepareStatement(hitPlusSql);
            pstmt.setInt(1,num);
            pstmt.executeUpdate();
            
            //게시글 한개 조회
            String getOneSql = "SELECT * FROM board WHERE num = ?";
            pstmt = con.prepareStatement(getOneSql);
            pstmt.setInt(1,num);
            rs = pstmt.executeQuery();

            if(rs.next()){
                bean.setNum(rs.getInt(1));
                bean.setWriter(rs.getString(2));
                bean.setEmail(rs.getString(3));
                bean.setSubject(rs.getString(4));
                bean.setPassword(rs.getString(5));
                bean.setReg_date(rs.getDate(6).toString());
                bean.setRef(rs.getInt(7));
                bean.setRe_step(rs.getInt(8));
                bean.setRe_level(rs.getInt(9));
                bean.setReadcount(rs.getInt(10));
                bean.setContent(rs.getString(11));
            }
            con.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return bean;
    }
    
    public void createReWrite(BoardBean boardbean) {
        int ref = boardbean.getRef();
        int re_step = boardbean.getRe_step();
        int re_level = boardbean.getRe_level();
        
        getCon();
        try{
//            부모글보다 큰 re_level의 값을 전부 1씩 증가시켜줌
            String levelsql = "UPDATE board SET re_level = re_level + 1 WHERE ref=? and re_level > ?";
            pstmt = con.prepareStatement(levelsql);
            pstmt.setInt(1, ref);
            pstmt.setInt(2, re_level);
            pstmt.executeUpdate();
            
            String reWriteCreateSql = "INSERT INTO board VALUES (board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
            pstmt = con.prepareStatement(reWriteCreateSql);
            pstmt.setString(1, boardbean.getWriter());
            pstmt.setString(2, boardbean.getEmail());
            pstmt.setString(3, boardbean.getSubject());
            pstmt.setString(4, boardbean.getPassword());
            pstmt.setInt(5, ref);
            pstmt.setInt(6,re_step + 1); //답글이어서 부모글 re_step에 1더해준대
            pstmt.setInt(7,re_level + 1); //답글이어서 부모글 re_level에 1더해준대
            pstmt.setString(8, boardbean.getContent());
            pstmt.executeUpdate();
            
            con.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        
    }
}
