package costcenter.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Area implements Serializable{
	private String areaCode;
	private String areaName;
	private String ProvinceCode;
	public Area() {
		super();
	}
	public Area(String areaCode, String areaName, String ProvinceCode) {
		super();
		this.areaCode = areaCode;
		String[] a=areaName.split(" ");
		//System.out.println(a[0]+"@ "+a[1]+"@ "+a[2]);
		//this.areaName = a[2].trim();//a[0].trim();
		this.areaName = areaName;
		this.ProvinceCode=ProvinceCode;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	
	
	public String getProvinceCode() {
		return ProvinceCode;
	}
	public void setProvinceCode(String provinceCode) {
		ProvinceCode = provinceCode;
	}
	@Override
	public String toString() {
		return "Area [areaCode=" + areaCode + ", areaName=" + areaName
				+ ", ProvinceCode=" + ProvinceCode + "]";
	} 

	
}
