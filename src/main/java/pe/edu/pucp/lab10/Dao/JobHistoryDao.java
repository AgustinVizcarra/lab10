package pe.edu.pucp.lab10.Dao;

import pe.edu.pucp.lab10.Beans.JobHistory;

import java.sql.*;

public class JobHistoryDao extends DaoBase{
    public void cambiarTrabajo(JobHistory jobHistory)
    {
        String sql = "insert into job_history (employee_id, start_date, end_date, job_id, department_id) values(?,?,now(),?,?)";
        try(Connection connection = this.getConection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);){
            preparedStatement.setInt(1,jobHistory.getEmployee_id());
            preparedStatement.setString(2,jobHistory.getStart_date());
            preparedStatement.setString(4,jobHistory.getJob_id());
            preparedStatement.setInt(5,jobHistory.getDepartment_id());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public  JobHistory obtenerHistorial(int employee_id){
        JobHistory jobHistory = new JobHistory();
        String sql = "select * from job_history where employee_id="+employee_id;
        try(Connection connection = this.getConection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(sql)){
            if(rs.next()){
             jobHistory.setEmployee_id(rs.getInt(1));
             jobHistory.setStart_date(rs.getString(2));
             jobHistory.setEnd_data(rs.getString(3));
             jobHistory.setJob_id(rs.getString(4));
             jobHistory.setDepartment_id(rs.getInt(5));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return jobHistory;
    }
}
