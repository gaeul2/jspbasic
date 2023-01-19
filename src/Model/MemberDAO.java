package Model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberDAO {
//    DAO 는 Data Access Object 의 줄임말
    /* 오라클 DB에 연결하고 select, insert, update, delete작업을 실행해주는 클래스
        항상 db 접근먼저.
     */
//    String dbID = "system";
//    String dbPassword = "1234";
//    String dbURL = "jdbc:oracle:thin:@localhost:1521:XE";
    
    Connection con; //DB에 접근할 수 있도록 설정해주는 클래스
    PreparedStatement pstmt; //DB에서 쿼리를 실행시켜주는 객체
    ResultSet rs; //DB테이블 조회 결과를 리턴받아 자바에 저장해주는 객체
    
    //db접근은 반복적인 작업이므로 메서드로 뺌
    public void getCon(){
//        커넥션 풀을 이용하여 DB에 접근하는 소스
        try{
            //외부에서 데이터를 읽어들이므로 context를 사용
            Context initctx = new InitialContext();
            //톰켓서버에 정보를 담아놓은 곳으로 이동
            Context envctx = (Context) initctx.lookup("java:comp/env");
            //DataSource 객체 선언->lookup(name: context.xml파일의 Resource 태그안의 name을 가져다 써야함
            DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
            //DataSource를 기준으로 커넥션을 연결해주시오
            con = ds.getConnection();
        } catch (Exception e){
            e.printStackTrace();
        }
        
//        try {
//            Class.forName("oracle.jdbc.driver.OracleDriver");
//
//            con = DriverManager.getConnection(dbURL, dbID, dbPassword);
//
//        } catch (Exception e) {
//
//        }
    }
    
    //DB에 회원정보 저장해주는 메서드
    public void insertMember(MemberBean mbean){
        try{
            getCon();
            String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";
            
            //PreparedStatement pstmt 로 쓰면 지역변수가 되므로 그냥 pstmt로 쓰자
            pstmt = con.prepareStatement(sql);
    
            pstmt.setString(1, mbean.getId());
            pstmt.setString(2, mbean.getPass1());
            pstmt.setString(3, mbean.getEmail());
            pstmt.setString(4, mbean.getTel());
            pstmt.setString(5, mbean.getHobby());
            pstmt.setString(6, mbean.getJob());
            pstmt.setString(7, mbean.getInfo());
            pstmt.setString(8, mbean.getAge());
            
            pstmt.executeUpdate();
            
            con.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    //모든회원의 정보를 리턴해주는 메소드 호출
    public Vector<MemberBean> getAllMember() {
    
        Vector<MemberBean> v = new Vector<>();
        
        /*DB접근 및 작업은 예외가 생길 수 있으므로 꼭 try catch 해줘야함
            IO, DB, 쓰레드, 네트워크 이 네가지는 무조건 예외처리필요
         */
         
        try{
            getCon();
            String sql = "SELECT * FROM MEMBER";
            //쿼리를 실행시켜주는 객체 선언
            pstmt = con.prepareStatement(sql);
            // 결과를 리턴해서 받아줌. 자바객체에 저장 -> ResultSet rs
            rs = pstmt.executeQuery();
            //몇개인지 모르므로 반복문사용해 rs에 저장된 데이터를 추출
            while (rs.next()) {// 저장된 데이터만큼 반목문을 돌리겠다.
                /*뽑아내서 데이터 객체에 집어넣야하므로 MemberBean 생성
                 컬럼으로 나뉘어진 데이터를 빈클래스에 저장
                 Memberbean()이 가방이라고 생각하면 같은가방에 집어넣으면 수정이됨.
                 그래서 반복문을 돌며 계속 생성
                 */
                MemberBean bean = new MemberBean();
                bean.setId(rs.getString(1));//db컬럼은 인덱스1부터 시작
                bean.setPass1(rs.getString(2));
                bean.setEmail(rs.getString(3));
                bean.setTel(rs.getString(4));
                bean.setHobby(rs.getString(5));
                bean.setJob(rs.getString(6));
                bean.setInfo(rs.getString(7));
                bean.setAge(rs.getString(8));
    
                //패키징된 memberbean클래스를 벡터에 저장
                v.add(bean); //vector는 인텍스 0부터 시작
            }
            con.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return v;
    }

    public MemberBean getOneMember(String id) {
        MemberBean bean = new MemberBean();
        try{
            getCon();
            String sql = "SELECT * FROM member WHERE id=?";
            pstmt = con.prepareStatement(sql);
            //?에 값을 맵핑
            pstmt.setString(1,id);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()){ //레코드가 있다면
                bean.setId(rs.getString(1));//db컬럼은 인덱스1부터 시작
                bean.setPass1(rs.getString(2));
                bean.setEmail(rs.getString(3));
                bean.setTel(rs.getString(4));
                bean.setHobby(rs.getString(5));
                bean.setJob(rs.getString(6));
                bean.setInfo(rs.getString(7));
                bean.setAge(rs.getString(8));
            }
            con.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return bean;
    }
    
    public String getPass(String id) {
        String pass = "";
        try{
            getCon();
            String sql = "SELECT pass1 FROM MEMBER WHERE id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.next()){
                pass = rs.getString(1); //하나만 받아왔으니까
            }
            con.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return pass;
    }
    
    public void updateMemberInfo(MemberBean mbean) {

        try{
            getCon();
            String sql = "UPDATE member SET email=?, tel=? WHERE id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,mbean.getEmail());
            pstmt.setString(2,mbean.getTel());
            pstmt.setString(3,mbean.getId());
            
            pstmt.executeUpdate();
            
            con.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public void deleteMember(String id) {
        getCon();
        try{
            String sql = "DELETE FROM member WHERE id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            
            pstmt.executeUpdate();
            con.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
