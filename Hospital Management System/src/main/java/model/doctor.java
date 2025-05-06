package model;

public class doctor {
	String name;
	String hospital;
	String speciality;
	String experience;
	String contact;
	String email;
	String country;
	String gender;
	String start_time;
	String weekday;
	String end_time;
	String location;
	int id;
	int Did;
	public void setDId(int Did) {
		this.Did = Did;
	}
	
	public int getDId() {
		return Did;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getId() {
		return id;
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
	
	public String getLocation() {
	    return location;
	}

	public void setLocation(String location) {
	    this.location = location;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHospital() {
		return hospital;
	}
	public void setHospital(String hospital) {
		this.hospital = hospital;
	}
	public String getSpeciality() {
		return speciality;
	}
	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
}
