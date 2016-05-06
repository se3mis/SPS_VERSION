package application.model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the WIRING_LAND_DETAIL database table.
 * 
 */
@Entity
@Table(name="WIRING_LAND_DETAIL")
public class WiringLandDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private WiringLandDetailPK id;

	@Column(name="ASSESSMENT_NO")
	private String assessmentNo;

	@Column(name="CONNECTION_TYPE")
	private BigDecimal connectionType;

	@Column(name="CUSTOMER_CATEGORY")
	private String customerCategory;

	@Column(name="CUSTOMER_TYPE")
	private String customerType;

	@Column(name="EXISTING_ACC_NO")
	private String existingAccNo;

	@Column(name="IS_GOVERNMENT_PLACE")
	private String isGovernmentPlace;

	@Column(name="METAL_CRUSHER")
	private BigDecimal metalCrusher;

	@Column(name="MOTOR_TOTAL")
	private BigDecimal motorTotal;

	@Column(name="NEIGHBOURS_ACC_NO")
	private String neighboursAccNo;

	@Column(name="NO_OF_BULBS")
	private BigDecimal noOfBulbs;

	@Column(name="NO_OF_DMG_METERS")
	private BigDecimal noOfDmgMeters;

	@Column(name="NO_OF_FANS")
	private BigDecimal noOfFans;

	@Column(name="NO_OF_PLUGS_15A")
	private BigDecimal noOfPlugs15a;

	@Column(name="NO_OF_PLUGS_5A")
	private BigDecimal noOfPlugs5a;

	@Column(name="OCCUPY_OWNER_CERTIFIED")
	private String occupyOwnerCertified;

	private String ownership;

	private BigDecimal phase;

	@Column(name="SAW_MILLS")
	private BigDecimal sawMills;

	@Column(name="SERVICE_CITY")
	private String serviceCity;

	@Column(name="SERVICE_POSTAL_CODE")
	private BigDecimal servicePostalCode;

	@Column(name="SERVICE_STREET_ADDRESS")
	private String serviceStreetAddress;

	@Column(name="SERVICE_SUBURB")
	private String serviceSuburb;

	@Column(name="TARIFF_CAT_CODE")
	private String tariffCatCode;

	@Column(name="TARIFF_CODE")
	private String tariffCode;

	@Column(name="WELDING_PLANT")
	private BigDecimal weldingPlant;
	
	@Column(name="DEMAND")
	private Long demand;

    public WiringLandDetail() {
    }

	public WiringLandDetailPK getId() {
		return this.id;
	}

	public void setId(WiringLandDetailPK id) {
		this.id = id;
	}
	
	public String getAssessmentNo() {
		return this.assessmentNo;
	}

	public void setAssessmentNo(String assessmentNo) {
		this.assessmentNo = assessmentNo;
	}

	public BigDecimal getConnectionType() {
		return this.connectionType;
	}

	public void setConnectionType(BigDecimal connectionType) {
		this.connectionType = connectionType;
	}

	public String getCustomerCategory() {
		return this.customerCategory;
	}

	public void setCustomerCategory(String customerCategory) {
		this.customerCategory = customerCategory;
	}

	public String getCustomerType() {
		return this.customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public String getExistingAccNo() {
		return this.existingAccNo;
	}

	public void setExistingAccNo(String existingAccNo) {
		this.existingAccNo = existingAccNo;
	}

	public String getIsGovernmentPlace() {
		return this.isGovernmentPlace;
	}

	public void setIsGovernmentPlace(String isGovernmentPlace) {
		this.isGovernmentPlace = isGovernmentPlace;
	}

	public BigDecimal getMetalCrusher() {
		return this.metalCrusher;
	}

	public void setMetalCrusher(BigDecimal metalCrusher) {
		this.metalCrusher = metalCrusher;
	}

	public BigDecimal getMotorTotal() {
		return this.motorTotal;
	}

	public void setMotorTotal(BigDecimal motorTotal) {
		this.motorTotal = motorTotal;
	}

	public String getNeighboursAccNo() {
		return this.neighboursAccNo;
	}

	public void setNeighboursAccNo(String neighboursAccNo) {
		this.neighboursAccNo = neighboursAccNo;
	}

	public BigDecimal getNoOfBulbs() {
		return this.noOfBulbs;
	}

	public void setNoOfBulbs(BigDecimal noOfBulbs) {
		this.noOfBulbs = noOfBulbs;
	}

	public BigDecimal getNoOfDmgMeters() {
		return this.noOfDmgMeters;
	}

	public void setNoOfDmgMeters(BigDecimal noOfDmgMeters) {
		this.noOfDmgMeters = noOfDmgMeters;
	}

	public BigDecimal getNoOfFans() {
		return this.noOfFans;
	}

	public void setNoOfFans(BigDecimal noOfFans) {
		this.noOfFans = noOfFans;
	}

	public BigDecimal getNoOfPlugs15a() {
		return this.noOfPlugs15a;
	}

	public void setNoOfPlugs15a(BigDecimal noOfPlugs15a) {
		this.noOfPlugs15a = noOfPlugs15a;
	}

	public BigDecimal getNoOfPlugs5a() {
		return this.noOfPlugs5a;
	}

	public void setNoOfPlugs5a(BigDecimal noOfPlugs5a) {
		this.noOfPlugs5a = noOfPlugs5a;
	}

	public String getOccupyOwnerCertified() {
		return this.occupyOwnerCertified;
	}

	public void setOccupyOwnerCertified(String occupyOwnerCertified) {
		this.occupyOwnerCertified = occupyOwnerCertified;
	}

	public String getOwnership() {
		return this.ownership;
	}

	public void setOwnership(String ownership) {
		this.ownership = ownership;
	}

	public BigDecimal getPhase() {
		return this.phase;
	}

	public void setPhase(BigDecimal phase) {
		this.phase = phase;
	}

	public BigDecimal getSawMills() {
		return this.sawMills;
	}

	public void setSawMills(BigDecimal sawMills) {
		this.sawMills = sawMills;
	}

	public String getServiceCity() {
		return this.serviceCity;
	}

	public void setServiceCity(String serviceCity) {
		this.serviceCity = serviceCity;
	}

	public BigDecimal getServicePostalCode() {
		return this.servicePostalCode;
	}

	public void setServicePostalCode(BigDecimal servicePostalCode) {
		this.servicePostalCode = servicePostalCode;
	}

	public String getServiceStreetAddress() {
		return this.serviceStreetAddress;
	}

	public void setServiceStreetAddress(String serviceStreetAddress) {
		this.serviceStreetAddress = serviceStreetAddress;
	}

	public String getServiceSuburb() {
		return this.serviceSuburb;
	}

	public void setServiceSuburb(String serviceSuburb) {
		this.serviceSuburb = serviceSuburb;
	}

	public String getTariffCatCode() {
		return this.tariffCatCode;
	}

	public void setTariffCatCode(String tariffCatCode) {
		this.tariffCatCode = tariffCatCode;
	}

	public String getTariffCode() {
		return this.tariffCode;
	}

	public void setTariffCode(String tariffCode) {
		this.tariffCode = tariffCode;
	}

	public BigDecimal getWeldingPlant() {
		return this.weldingPlant;
	}

	public void setWeldingPlant(BigDecimal weldingPlant) {
		this.weldingPlant = weldingPlant;
	}

	public Long getDemand() {
		return demand;
	}

	public void setDemand(Long demand) {
		this.demand = demand;
	}

	@Override
	public String toString() {
		return "WiringLandDetail [id=" + id + ", assessmentNo=" + assessmentNo
				+ ", connectionType=" + connectionType + ", customerCategory="
				+ customerCategory + ", customerType=" + customerType
				+ ", existingAccNo=" + existingAccNo + ", isGovernmentPlace="
				+ isGovernmentPlace + ", metalCrusher=" + metalCrusher
				+ ", motorTotal=" + motorTotal + ", neighboursAccNo="
				+ neighboursAccNo + ", noOfBulbs=" + noOfBulbs
				+ ", noOfDmgMeters=" + noOfDmgMeters + ", noOfFans=" + noOfFans
				+ ", noOfPlugs15a=" + noOfPlugs15a + ", noOfPlugs5a="
				+ noOfPlugs5a + ", occupyOwnerCertified="
				+ occupyOwnerCertified + ", ownership=" + ownership
				+ ", phase=" + phase + ", sawMills=" + sawMills
				+ ", serviceCity=" + serviceCity + ", servicePostalCode="
				+ servicePostalCode + ", serviceStreetAddress="
				+ serviceStreetAddress + ", serviceSuburb=" + serviceSuburb
				+ ", tariffCatCode=" + tariffCatCode + ", tariffCode="
				+ tariffCode + ", weldingPlant=" + weldingPlant + ", demand=" + demand + "]";
	}
	
	

}