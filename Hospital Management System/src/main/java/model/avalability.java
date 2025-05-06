package model;

public class avalability {
	
	int id;
	int doctorID;
	String weekday;
	String start_time;
	String end_time;
	String doctor_name;
	private String location;

	
	
	public void setDoctorName(String doctor_name) {
	    this.doctor_name = doctor_name;
	}
	
	public String getDoctorName() {
	    return doctor_name;
	}
	
	public String getLocation() {
	    return location;
	}

	public void setLocation(String location) {
	    this.location = location;
	}

	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getId() {
		return id;
	}
	
	public int getDoctorID() {
		return doctorID;
	}
	public void setDoctorID(int doctorID) {
		this.doctorID = doctorID;
	}
	public String getWeekday() {
		return weekday;
	}
	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	
	
}
