package pe.edu.pucp.lab10.Beans;

public class JobHistory {
    private int Employee_id;
    private String Start_date;
    private String End_data;
    private String job_id;
    private int Department_id;

    public int getEmployee_id() {
        return Employee_id;
    }

    public void setEmployee_id(int employee_id) {
        Employee_id = employee_id;
    }

    public String getStart_date() {
        return Start_date;
    }

    public void setStart_date(String start_date) {
        Start_date = start_date;
    }

    public String getEnd_data() {
        return End_data;
    }

    public void setEnd_data(String end_data) {
        End_data = end_data;
    }

    public String getJob_id() {
        return job_id;
    }

    public void setJob_id(String job_id) {
        this.job_id = job_id;
    }

    public int getDepartment_id() {
        return Department_id;
    }

    public void setDepartment_id(int department_id) {
        Department_id = department_id;
    }
}
