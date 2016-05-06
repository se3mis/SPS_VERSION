package estimate.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the PCESTHTT database table.
 * 
 */
@Embeddable
public class PcesthttPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="ESTIMATE_NO")
	private String estimateNo;

	@Column(name="REV_NO")
	private long revNo;

	@Column(name="DEPT_ID")
	private String deptId;

    public PcesthttPK() {
    }
	public String getEstimateNo() {
		return this.estimateNo;
	}
	public void setEstimateNo(String estimateNo) {
		this.estimateNo = estimateNo;
	}
	public long getRevNo() {
		return this.revNo;
	}
	public void setRevNo(long revNo) {
		this.revNo = revNo;
	}
	public String getDeptId() {
		return this.deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof PcesthttPK)) {
			return false;
		}
		PcesthttPK castOther = (PcesthttPK)other;
		return 
			this.estimateNo.equals(castOther.estimateNo)
			&& (this.revNo == castOther.revNo)
			&& this.deptId.equals(castOther.deptId);

    }
    
	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.estimateNo.hashCode();
		hash = hash * prime + ((int) (this.revNo ^ (this.revNo >>> 32)));
		hash = hash * prime + this.deptId.hashCode();
		
		return hash;
    }
	@Override
	public String toString() {
		return "PcesthttPK [estimateNo=" + estimateNo + ", revNo=" + revNo
				+ ", deptId=" + deptId + "]";
	}
	
	
}